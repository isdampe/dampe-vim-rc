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
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mattn/webapi-vim'
Plugin 'Wildog/airline-weather.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'raimondi/delimitmate'
Plugin 'isruslan/vim-es6'
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'tomasiser/vim-code-dark'
Plugin 'chriskempson/base16-vim'
Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'tpope/vim-fugitive'
Plugin 'stanangeloff/php.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'lleonini/kernel-coding-style'
Plugin 'leafgarland/typescript-vim'
Bundle 'sonph/onehalf', {'rtp': 'vim/'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable       "Syntax on
colorscheme PaperColor
set background=dark

let g:airline_theme='onedark'
let g:weather#area = 'melbourne, au'
let g:weather#unit = 'metric'
let g:weather#appid = '13427d911c552daabf1638ed3c2a126f'
let g:weather#cache_ttl = '1800'
let g:airline_section_warning = ''
let g:airline_section_y = ''
let g:airline_section_x = ''
let g:airline_section_b = '%-0.32{getcwd()}'
let g:airline_section_c = '%t'
silent !rm ~/.cache/.weather

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

nnoremap <silent> <Esc><Esc> :nohl<CR><C-l>

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

	colorscheme base16-monokai
	let g:airline_theme='molokai'

	"Hide menu bars
	set guioptions =

	set background=dark

	"Set gui font
	set guifont=Droid\ Sans\ Mono\ for\ Powerline
	set linespace=1
	let g:airline_powerline_fonts = 1

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

:command MbedBuildDeploy !gcc4mbed_deploy
nnoremap <F5> :w\|:MbedBuildDeploy<CR>

function! FindInProject(term)
	! grep -rl a:term
endfunction
command! -nargs=1 FF call FindInProject(<f-args>)
