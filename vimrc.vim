" Sexy vim configs with pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" No Vi Compatibility. That just sucks.
set nocompatible

" Fix backspace indentation
set backspace=indent,eol,start


" Convince Vim it can use 256 colors inside the terminal
" Needs CSApprox plugin
set t_Co=256


" This must happen before the syntax system is enabled
" aunmenu Help.
" aunmenu Window.
let no_buffers_menu=1

" Enable mouse everywhere
" set mouse=a

" Hide mouse pointer while typing
set mousehide
set mousemodel=popup

" Code Folding, everything folded by default
set foldmethod=indent
set foldlevel=99
set foldenable

" Better modes.  Remeber where we are, support yankring
set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo

" Move Backup Files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" Turn off annoying swapfiles
set noswapfile

" Set persistent undo (v7.3 only)
set undodir=~/.vim/undodir
set undofile

" Enable Syntax Colors
syntax on
if has("gui_running")
  set guifont=Mensch\ 10
else
  colorscheme mustang
endif

set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
"call togglebg#map("<F5>")


" Set fixed height widht of gvim window
if has('gui_running')
  set lines=46
endif

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

" Set <leader> to ',' and <localleader> to "\"
let mapleader=","
let maplocalleader="\\"

noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

" <F1> and <F2> for save in all three modes
noremap <F2> <Esc>:w<CR>
inoremap <F2> <Esc>:w<CR>
nnoremap <F2> <Esc>:w<CR>
vnoremap <F2> <Esc>:w<CR>

noremap  <F1> <Esc>:w<CR>
inoremap <F1> <Esc>:w<CR>
nnoremap <F1> <Esc>:w<CR>
vnoremap <F1> <Esc>:w<CR>

" <leader>dd to delete buffer
noremap <leader>bd <Esc>:bd<CR>
vnoremap <leader>bd <Esc>:bd<CR>

" Toggle pate with <F3>
set pastetoggle=<F3>

" Rempam Vim 0 to ^
noremap 0 ^

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Enable hidden buffers
set hidden

" Enable automatic title setting for terminals
set title
set titleold="Terminal"
set titlestring=%F\ -\ Vim

" Enable filetype plugins and indention
filetype on
filetype plugin on

" Activate a permanent ruler 
set ruler

" Disable Toolbar, Scrollbar
set guioptions-=T
set guioptions-=r

" Disable the stupid pydoc preview window for the omni completion
set completeopt-=preview

" Disable the blinking cursor.
set gcr=a:blinkon0

" Highlight current line 
if has("gui_running")
  set cursorline
endif

set ttyfast

" Customize the wildmenu
set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class
set wildmode=list:full


" Go with smartindent if there is no plugin indent file.
set autoindent  smartindent
" But don't outdent hashes
inoremap # X#

" Global by default
set gdefault

" Better Search
set hlsearch
set incsearch
set showmatch

" Hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" NERDtree on <leader>t
" nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" Make the command line two lines high and change the statusline display to
" something that looks useful.
set cmdheight=2
set laststatus=2

if exists("*TagInStatusLine")
    " XXX the test is done too soon, and TagInStatusLine never exists
    set statusline=%n:%<%f\ %h%m%r\ %1*%{TagInStatusLine()}%*\ %=%-10.(%l,%c%V%)\ %4L\ %P
else
    set statusline=%n:%<%f\ %h%m%r\ %=%-10.(%l,%c%V%)\ %4L\ %P
endif
" set statusline=[%l,%v\ %P%M][CWD:\ %{CWD()}][FILE:\ %f]\ %r%h%w\ (%{&ff})\ %#warningmsg#%{SyntasticStatuslineFlag()}%*
set showcmd
set showmode
set number

function! CWD()
    let curdir = substitute(getcwd(), '/home/mnazim', "~/", "g")
    return curdir
endfunction

" Tab Settings
set smarttab
set softtabstop=4
set tabstop=4

" Move to the next line
set whichwrap=<,>

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" GUI Tab settings
function! GuiTabLabel()
  let label = ''
  let buflist = tabpagebuflist(v:lnum)
  if exists('t:title')
    let label .= t:title . ' '
  endif
  let label .= '[' . bufname(buflist[tabpagewinnr(v:lnum) - 1]) . ']'
  for bufnr in buflist
    if getbufvar(bufnr, '&modified')
      let label .= '+'
      break
    endif
  endfor
  return label
endfunction
set guitablabel=%{GuiTabLabel()}

" utf-8 default encoding
set enc=utf-8

" Prefer unix over windows over os9 formats
set fileformats=unix,mac,dos

" Don't bell or blink(Courtesy: Cream Editor).
if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif

" Keep some more lines for scope
set scrolloff=5

" hide some files and remove stupid help
let g:netrw_list_hide='^\.,.\(pyc\|pyo\|mo\)$'
" let g:netrw_list_hide='^\.,.\(pyc\|pyo\|o\)$'

let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

" ; is an alias for :
nnoremap ; :

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
autocmd FileType * setlocal colorcolumn=0

" python support
" --------------
"  don't highlight exceptions and builtins. I love to override them in local
"  scopes and it sucks ass if it's highlighted then. And for exceptions I
"  don't really want to have different colors for my own exceptions ;-)
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 colorcolumn=79
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" ruby support
" ------------
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=79

" template language support (SGML / XML too)
" ------------------------------------------
" and disable taht stupid html rendering (like making stuff bold etc)

fun! SelectHTML()
  let n = 1
  while n < 50 && n < line("$")
    " check for jinja
    if getline(n) =~ '{%\s*\(extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
      set ft=htmljinja
      return
    endif
    " check for mako
    if getline(n) =~ '<%\(def\|inherit\)'
      set ft=mako
      return
    endif
    " check for genshi
    if getline(n) =~ 'xmlns:py\|py:\(match\|for\|if\|def\|strip\|xmlns\)'
      set ft=genshi
      return
    endif
    let n = n + 1
  endwhile
  " go with html
  set ft=html
endfun

autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako,config,puppet,salt setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
autocmd BufNewFile,BufRead *.html,*.htm  call SelectHTML()
autocmd BufNewFile,BufRead *.cfg setlocal ft=config
autocmd BufNewFile,BufRead *.pp setlocal ft=puppet
autocmd BufNewFile,BufRead *.sls setlocal ft=salt
let html_no_rendering=1

autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" CSS
" ---
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" rst
" ---
autocmd BufNewFile,BufRead *.rst setlocal ft=rst
autocmd FileType rst setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=79
\ formatoptions+=nqt textwidth=74

" markdown
" ---
autocmd BufNewFile,BufRead *.txt,*.markdown,*.md setlocal ft=markdown colorcolumn=79
autocmd FileType rst setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=79

" vim
" ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" Javascript
" ----------
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=79
let javascript_enable_domhtmlcss=1

" Highlight the extra spaces
" --------------------------
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+$\|\ze\t/

" Highlight the double spaces
" ---------------------------
highlight DoubleWhitespace ctermbg=darkgreen guibg=lightgreen
match DoubleWhitespace /\s\s/

" Personal Shortcuts
" ------------------
nnoremap <leader>t :NERDTreeToggle<CR>

" Pep8 & PyFlakes
" ---------------
autocmd BufWritePre *.py call Pep8()

" Clipboard
" ---------
set clipboard=unnamed
