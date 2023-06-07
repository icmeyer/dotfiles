"Vundle stuff first
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/icmeyer/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'lervag/vimtex'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'github/copilot.vim'
Plugin 'https://github.com/twitvim/twitvim.git'
Plugin 'vimwiki/vimwiki'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
 

""
"" LaTeX (rubber) macro
"nnoremap <leader>c :w<CR>:!pdflatex %<CR>
"
"" View PDF macro; '%:r' is current files root -base- name.
"nnoremap <leader>v :!evince %:r.pdf &<CR><CR>

" " Python: save the file and run script printing results to output
" nnoremap <leader>p :w<CR>:!python % &> %.o <CR> :!echo ---------------- >> %.o <CR><CR>
" Python: save the file and run, printing results to window
" nnoremap <leader>o :w<CR>:terminal python % <CR> Gi
nnoremap <leader>o :w<CR>:! python % <CR>
" C++: compile and run
nnoremap <leader>i :w <bar> exec '!g++ '.shellescape('%').' -std=c++11 -o '.shellescape('%:r').' -std=c++11 && ./'.shellescape('%:r')<CR>
"Now with openmp
nnoremap <leader>u :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' -fopenmp && ./'.shellescape('%:r')<CR>
"No std
nnoremap <leader>f :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
"Quick make 
nnoremap <leader>m :w <CR>:! make<CR>

" Clip file handling
" Write to clip file
vnoremap <leader>b :'<,'>w! ~/.clip <CR>
" Read from clip file
nnoremap <leader>r :r ~/.clip <CR> 

"In all files, automatically indent new line to previous line indent
set autoindent

"" show existing tab with 4 spaces width
set tabstop=4
"" when indenting with >, use 4 spaces width
set shiftwidth=4
"" On pressing tab, insert 4 spaces
set expandtab


"Set highlighting for column 80 and above in python
augroup vimrc_autocmds
      autocmd FileType python highlight OverLength ctermbg=red ctermfg=white guibg=#592929
      autocmd FileType python match OverLength /\%80v.\+/
augroup END

"Tagbar
"Note: use <c-w><c-w> to switch focus to the tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>

"Remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"Statusline
"for default use
set laststatus=2
"Custom below
set statusline=
set statusline+=%{expand('%:p:h:t')}/%t
set statusline+=%m
set statusline+=%r
set statusline+=%=
set statusline+=\ %l:%c
set statusline+=\ %p%%
set statusline+=\ 
"Use ctermbg=None to remove highlight
hi StatusLine cterm=None ctermfg=11 ctermbg=4

"Notes:
"Use ']p' to paste at same indent level!
"
" See vimtex commands
" :help vimtex
" 
" For incrementing a column of numbers, use visual highlight (Ctrl-v) then
" `g Ctrl-a`
"
"  0 1
"  0 2
"  0 3
"  0 4
"  0 5
"

" Template insertion
" Two part: the plain text from a template
" Helpful links:
" https://stackoverflow.com/questions/55469524/how-to-write-vim-function-to-paste-a-template-text-into-current-file
" https://superuser.com/questions/93492/how-to-add-a-command-in-vim-editor
" https://stackoverflow.com/questions/690386/writing-a-vim-function-to-insert-a-block-of-static-text 
" nnoremap <space>t :-1read $HOME/.vim/templates/go/base.go<CR>/{<CR>o
function! PyPLOT()
    r~/.vim/templates/python/plotting.py
    /ax\.
endfunction
command Pyplot :call PyPLOT() | :startinsert! " startinsert! enters insert mode at end of line

"Folding
:set foldmethod=manual
inoremap <F8> <C-O>za
nnoremap <F8> za
onoremap <F8> <C-C>za
vnoremap <F8> zf

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Don't spellcheck latex comments
let g:tex_comment_nospell=1

" Use dark background for colorscheme
:set background=dark

" Set highlighting on
:set hlsearch

" Shortcuts for sideways.vim
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

" No more EX mode!
map q: <Nop>
nnoremap Q <nop>

" Unset digit incrementing
nnoremap <c-a> <nop>

" Yank full line
nnoremap Y yy

" vimwiki things
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

let wiki = {}
let wiki.path = '~/Dropbox (Personal)/vimwiki'
let wiki.syntax = 'markdown'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let g:vimwiki_list = [wiki]

set backspace=indent,eol,start
syntax on

" ctags
set tags=./tags;,tags;

" Rename tmux window to name of file opened by vim
" First get window name, if no tmux server do nothing, if custom name do
" nothing
" Notes: runs on opening a file, redirects stderr output, concatenate command
" using `.`
autocmd BufReadPost,FileReadPost,BufNewFile * call system("mywindow=$(tmux display-message -p '#W' 2> /dev/null); if  [ -z \"$mywindow\" ] || [ $mywindow = \"Vim\" ] || [ $mywindow = \"zsh\" ]; then tmux rename-window " . expand("%") . "; fi;")

