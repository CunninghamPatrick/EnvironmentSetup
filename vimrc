set nocompatible              " be iMproved, required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'tmhedberg/SimpylFold'		" code folding
Plugin 'Valloric/YouCompleteMe'		" auto-completer
Plugin 'vim-syntastic/syntastic'	" syntax checking/highlighting
Plugin 'nvie/vim-flake8'			" PEP8 checker
Plugin 'scrooloose/nerdtree'		" file tree
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'christoomey/vim-tmux-navigator'
" ...

" All of your Plugins must be added before the following line
call vundle#end()			" required
filetype plugin indent on	" required

colorscheme myelflord

" make backspace work as expected
set backspace=eol,start,indent

syntax on
let python_highlight_all=1

" search as you type
set incsearch

" disable search result highlighting
"set nohls

" enable search result highlighting
set hlsearch

" Set line numbers on
set nu

" Fixes common typos
"  correct :W to :w #typo
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
"  correct :Q to :q #typo
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))

set pastetoggle=<F11>

" Always display the current cursor position in the lower right corner of the vim window.
set ruler

" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" set preferred splitting behavior
set splitbelow
set splitright

" set preferred split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" enable folding and remap fold/unfold to space
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" flag unnecessary whitespace
" Broken? :c
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" ensure vim is using utf-8 encoding for python
au BufNewFile,BufRead *.py set encoding=utf-8

" auto save and load vim view
augroup AutoSaveFOlds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent loadview
augroup END

" customize YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" first line closes autocomplete window once I'm done with it
" second line lets me ctrl-g to goto the definition of what im currently on

" Set default yank register to the primary
set clipboard=unnamed

"hide .pyc files from file tree (nerd tree)
let NERDTreeIgnore=['\.pyc$', '\~$']

" Preferred indentation rules
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=120
set autoindent
set smartindent
set fileformat=unix

au BufNewFile,BufRead *.f set filetype=scheme

