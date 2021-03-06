vim.cmd([[
    augroup general
    autocmd!
    autocmd TermOpen term://* startinsert
    autocmd FocusGained * :checktime
    autocmd Filetype lua nnoremap <silent><leader>nv <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/nvim" }<CR>
    augroup END
    ]])

vim.cmd([[
    augroup web
    autocmd!
    autocmd InsertLeave *.css :BLReloadCSS
    autocmd FileType html nnoremap <F3> :!http-server . &<CR><CR>
    autocmd FileType html nnoremap <F4> :!setsid firefox http://localhost:8080/%<CR><CR>
    autocmd VimLeave *.html !killall node
    augroup END
    ]])

vim.cmd([[
    augroup rust
    autocmd!
    autocmd BufNewFile,BufRead *.rs set filetype=rust
    autocmd FileType rust nnoremap <F3> :w<CR> :16split term://rustc % && ./%:r<CR>
    autocmd FileType rust nnoremap <F4> :w<CR> :16split term://cargo run<CR>
    autocmd FileType rust nnoremap <F5> :w<CR> :16split term://cargo run --<Space>
    autocmd FileType rust nnoremap <leader><F4> :w<CR> :16split term://cargo run --target x86_64-unknown-linux-musl<CR>
    autocmd FileType rust nnoremap <leader>t :call Rust_toggle()<CR>
    autocmd FileType rust nnoremap <silent><leader>. a-><space>
    autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', enabled = {"ChainingHint"} }
    augroup END
    ]])

vim.cmd([[
    augroup nim
    autocmd!
    autocmd BufNewFile,BufRead *.nim set filetype=nim
    autocmd FileType nim nnoremap <F3> :w<CR> :16split term://nim c -r %<CR>
    autocmd FileType nim nnoremap <F4> :w<CR> :16split term://nimble run *.nimble<CR>
    autocmd FileType nim nnoremap <F5> :w<CR> :16split term://nimble run *.nimble
    autocmd FileType nim nnoremap <leader>t :call Nim_toggle()<CR>
    augroup END
    ]])

vim.cmd([[
    augroup cc
    autocmd!
    autocmd FileType c,cpp nnoremap <F3> :w<CR> :16split term://make<CR>
    autocmd FileType c,cpp nnoremap <leader><F3> :w<CR> :16split term://make -B<CR>
    autocmd FileType c,cpp nnoremap <F4> :w<CR> :16split term://make run<CR>
    autocmd FileType c,cpp nnoremap <F5> :w<CR> :16split term://make run ARGS=
    autocmd FileType c,cpp nnoremap <F6> :w<CR> :16split term://./%:r<CR>
    autocmd Filetype c,cpp nnoremap <silent><leader>fm :!clang-format -style="{BasedOnStyle: google, IndentWidth: 4}" -i % <CR><CR>
    augroup END
    ]])

vim.cmd([[
    augroup nvim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevel=0
    autocmd FileType vim nnoremap <F5> :source ~/.config/nvim/init.vim<CR>
    augroup END
    ]])

vim.cmd([[
    augroup cloj
    autocmd!
    autocmd FileType clojure nnoremap <F3> :FireplaceConnect 127.0.0.1:
    autocmd FileType clojure nnoremap <F4> :16sp term://lein run<CR>
    autocmd FileType clojure nnoremap <F5> :16sp term://lein run
    autocmd FileType clojure nnoremap <leader>e :%Eval<CR>
    autocmd FileType clojure vnoremap <leader>e :Eval<CR>
    autocmd FileType clojure nnoremap <leader>dd :Doc <C-R><C-W><CR>
    autocmd FileType clojure setlocal lisp
    augroup END
    ]])

vim.cmd([[
    augroup vimwik
    autocmd!
    autocmd FileType vimwiki nnoremap <F3> :Vimwiki2HTMLBrowse<CR>
    autocmd FileType vimwiki nnoremap <F4> :VimwikiTable<CR>
    autocmd FileType vimwiki nnoremap <F5> :!setsid firefox ~/vimwiki_html/%:r.html<CR><CR>
    autocmd FileType vimwiki nnoremap <leader>h1 I= <ESC>A =<ESC>
    autocmd FileType vimwiki nnoremap <leader>h2 I== <ESC>A ==<ESC>
    autocmd FileType vimwiki nnoremap <leader>h3 I=== <ESC>A ===<ESC>
    autocmd FileType vimwiki nnoremap <leader>h4 I==== <ESC>A ====<ESC>
    autocmd FileType vimwiki nnoremap <leader>h5 I===== <ESC>A =====<ESC>
    augroup END
    ]])

vim.cmd([[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
    augroup END
    ]])

vim.cmd([[
    augroup i3syntax
    autocmd!
    autocmd BufRead $HOME/.config/i3/config set ft=i3config
    augroup END
    ]])

vim.cmd([[
    augroup tex
    autocmd!
    autocmd FileType tex let b:AutoPairs = AutoPairsDefine({"$": "$"})
    autocmd FileType tex nnoremap <F3> :!setsid zathura %:r.pdf<CR><CR>
    autocmd FileType tex nnoremap <leader>lor a$\lor$
    autocmd FileType tex nnoremap <leader>land a$\land$
    autocmd FileType tex nnoremap <leader>neg a$\neg$
    augroup END
    ]])

vim.cmd([[
    augroup NvimDap
    autocmd!
    au FileType dap-repl lua require('dap.ext.autocompl').attach()
    augroup END
    ]])

vim.cmd([[
    augroup php
    autocmd!
    autocmd BufRead *.php set indentexpr =
    autocmd BufRead *.php set autoindent
    autocmd BufRead *.php set smartindent
    augroup END
    ]])

