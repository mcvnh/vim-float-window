# vim-float-window

Open the float window in the center of the current editor screen;

```
:call OpenFloatWindow()
```

In case of execute a command after the float window opened, example `tig` or `git log`

```
:call OpenFloatWindow("tig")
:call OpenFloatWindow("git log")
```

Key mapping examples:

```
nnoremap <Leader>a :call OpenFloatTerm()<CR>
nnoremap <Leader>at :call OpenFloatTerm("tig")<CR>
```
