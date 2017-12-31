set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'raimondi/delimitmate'
Plugin 'isruslan/vim-es6'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'tomasiser/vim-code-dark'
Plugin 'chriskempson/base16-vim'
Plugin 'sickill/vim-monokai'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'tpope/vim-fugitive'
Plugin 'stanangeloff/php.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable       "Syntax on
colorscheme PaperColor
set background=dark
let g:airline_theme='papercolor'

"Use 2 spaces for shifting.
set tabstop=4 "Show existing tabs with width of 4
set shiftwidth=4 "When pressing tab 
set smarttab
set number
set showcmd
set cursorline
filetype indent on
set wildmenu				"Awesome autocomplete gui menu
set dir=/tmp
set colorcolumn=80
set lazyredraw      "Only redraw when necessary
set showmatch       "Highlight matching [{()}]

"Searching
set incsearch
set hlsearch
set nowrap

"Mouse
set ttyfast
set mouse=a

"Remapping - auto expand brackets.
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

"Allow sudo write by :w!!
cnoremap w!! w !sudo tee > /dev/null %

"Autocomplete menu color
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

"Open NERDTree and then activate buffer
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"YouCompleteMe
"Auto-close the preview window after selection
let g:ycm_auto_trigger = 1
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

set t_Co=256

"If running GVIM
if has("gui_running")

	"Hide menu bars
	set guioptions =

	set background=dark

	"Set gui font
	set guifont=Monaco

	vmap <C-S-x> "+x
	vmap <C-S-c> "+y
	"Paste from clipboard
	imap <C-S-V> <Esc>"+pi<Esc>la
	set lines=55 columns=200

	set noerrorbells visualbell t_vb=
	autocmd GUIEnter * set visualbell t_vb=

endif

"Automatically copy the output of TOhtml to the system clipboard
function! CopyAsHtml(line1, line2)
  exec a:line1.','.a:line2.'TOhtml'
  call feedkeys('ggvG$"+y"')
endfunction
command! -range=% CopyAsHtml :call CopyAsHtml(<line1>,<line2>)