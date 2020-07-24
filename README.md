# clipboard-yank-post

Copy to the system clipboard after yanking, not before.

The idiom in vim is to specify the register before executing a delete or yank
operation. This plugin allows to optionally tell vim to transfer the contents
of the default unnamed register to the system clipboard (plus register).

Instead of doing `"+y<motion>` you can do `y<motion><cr>` to achieve the same
effect. It works by mapping a temporary command to `<cr>` (Enter or Return),
so the contents are transferred to the clipboard and the key is unmapped.
If the cursor moves, the key is also unmapped.
