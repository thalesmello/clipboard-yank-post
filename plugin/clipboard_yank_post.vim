augroup ClipboardYankPost
    function! s:clipboard_yank_post_return()
        let @+ = @"
        echo "Register copied to clipboard!"
        call s:clipboard_yank_post_deregister()
    endfunction

    function! s:clipboard_yank_post_deregister()
        nunmap <buffer><cr>
        autocmd! ClipboardYankPostReturn
    endfunction

    function! s:clipboard_yank_post_callback()
        if v:event["regname"] != ""
            return
        endif

        augroup ClipboardYankPostReturn
            autocmd!
            nnoremap <buffer><cr> :<c-u>call <SID>clipboard_yank_post_return()<cr>
            autocmd CursorMoved * call s:clipboard_yank_post_deregister()
        augroup end
    endfunction

    autocmd!
    autocmd TextYankPost * call s:clipboard_yank_post_callback()
augroup end
