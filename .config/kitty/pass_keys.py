# shamelessly stolen from vim-kitty navigator 
import re

from kittens.tui.handler import result_handler
from kitty.key_encoding import KeyEvent, parse_shortcut


def is_window_vim(window, vim_id):
    fp = window.child.foreground_processes
    return any(re.search(vim_id, p['cmdline'][0] if len(p['cmdline']) else '', re.I) for p in fp)


def encode_key_mapping(window, key_mapping):
    mods, key = parse_shortcut(key_mapping)
    event = KeyEvent(
        mods=mods,
        key=key,
        shift=bool(mods & 1),
        alt=bool(mods & 2),
        ctrl=bool(mods & 4),
        super=bool(mods & 8),
        hyper=bool(mods & 16),
        meta=bool(mods & 32),
    ).as_window_system_event()

    return window.encoded_key(event)


def main():
    pass


@result_handler(no_ui=True)
def handle_result(args, result, target_window_id, boss):
    direction = args[1]
    key_mapping = args[2]
    vim_id = args[3] if len(args) > 3 else "n?vim"

    window = boss.window_id_map.get(target_window_id)

    if window is None:
        return
    if is_window_vim(window, vim_id):
        for keymap in key_mapping.split(">"):
            encoded = encode_key_mapping(window, keymap)
            window.write_to_child(encoded)
    else:
        boss.active_tab.neighboring_window(direction)

#  Shamelessly stolen from vim-kitty-tmux navigator
# import kitty.conf.utils as ku
# import kitty.key_encoding as ke
# from kitty import keys
# import re
# 
# 
# def main():
#     """ needed but not used """
#     pass
# 
# def actions(extended):
#     yield keys.defines.GLFW_PRESS
#     if extended:
#         yield keys.defines.GLFW_RELEASE
# 
# def convert_mods(mods):
#     """
#     converts key_encoding.py style mods to glfw style mods as required by key_to_bytes
#     """
#     glfw_mods = 0
#     if mods & ke.SHIFT:
#         glfw_mods |= keys.defines.GLFW_MOD_SHIFT
#     if mods & ke.ALT:
#         glfw_mods |= keys.defines.GLFW_MOD_ALT
#     if mods & ke.CTRL:
#         glfw_mods |= keys.defines.GLFW_MOD_CONTROL
#     if mods & ke.SUPER:
#         glfw_mods |= keys.defines.GLFW_MOD_SUPER
#     return glfw_mods
# 
# def pass_key(key_combination: str, w):
#     """
#     pass key_combination to the kitty window w.
#     Args:
#         key_combination (str): keypress to pass. e.g. ctrl-j
#         w (kitty window): window to pass the keys
#     """
#     mods, key, is_text = ku.parse_kittens_shortcut(key_combination)
#     extended = w.screen.extended_keyboard
#     for action in actions(extended):
#         sequence = (
#             ('\x1b_{}\x1b\\' if extended else '{}')
#             .format(
#                 keys.key_to_bytes(
#                     getattr(keys.defines, 'GLFW_KEY_{}'.format(key.upper())),
#                     w.screen.cursor_key_mode, extended, convert_mods(mods), action)
#                 .decode('ascii')))
#         print(repr(sequence))
#         w.write_to_child(sequence)
# 
# 
# def handle_result(args, result, target_window_id, boss):
#     """ Main entry point for the kitten. Decide wether to change window or pass
#     the keypress
#     Args:
#         args (list): Extra arguments passed when calling this kitten
#             [0] (str): kitten name
#             [1] (str): direction to move
#             [2] (str): key to pass
#     The rest of the arguments comes from kitty
#     """
#     # get active window and tab from target_window_id
#     w = boss.window_id_map.get(target_window_id)
#     if w is None:
#         return
# 
#     # Check if keyword in the foreground process
#     proc = w.child.foreground_processes[0]['cmdline']
#     keywords = ['vim', 'nvim', 'ssh', 'tmux']
#     for keyword in keywords:
#         if keyword in proc:
#             pass_key(args[2], w)
#             return
# 
#     # keywords not found, move to neighboring window instead
#     boss.active_tab.neighboring_window(args[1])
# 
# handle_result.no_ui = True
