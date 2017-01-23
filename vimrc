" .vimrc
" Copied from https://gist.github.com/1377245
" or http://pastebin.com/jJQFxQpR
" which was Copied from https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
" http://sontek.net/turning-vim-into-a-modern-python-ide
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
" https://github.com/gmarik/vundle#about

" Preamble ------------------------------------------- {{{

set nocompatible                                          " Don't use Vi compatibility
filetype off                                              " required
let python_highlight_all = 1
let python_print_as_function = 1
let g:Powerline_symbols='fancy'

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/gundo.vim'
Bundle 'weynhamz/vim-plugin-minibufexpl'
Bundle 'vim-scripts/pep8'
Bundle 'fs111/pydoc.vim'
Bundle 'kevinw/pyflakes-vim'
" Bundle 'msanders/snipmate.vim'
" Bundle 'ervandew/supertab'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'erikw/tmux-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nvie/vim-flake8'
Bundle 'tpope/vim-surround'
" Bundle 'Valloric/YouCompleteMe'
"Bundle 'alfredodeza/khuno.vim'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'

" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

filetype plugin on                                      " Load plugin if one exists for current filetype
filetype plugin indent on                               " Load indent pluing if one exists for current ft. Disable auto-indenting

" Brief help
" :BundLeList - list configured bundles
" :BundLeInstall(!) - install(update) bundles
" :BundLeSearch(!) foo - searc(or referesh cache first) for foo
" :BundLeClean(!)  - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
" }}}
" Basic options -------------------------------------- {{{
set encoding=utf-8                                      " Set encoding inside vim to 32bit UTF-8 encoded Unicode
set termencoding=utf-8                                  " Set term encoding
" set modelines=0                                         " Prevent (some) modelines security exploits
set autoindent                                          " Copy indent from current line when CR or o/O commands used
set copyindent                                          " Autoindent copies indent format of previous line
set nosmartindent                                       " Explicitly don't try to guess how I want my indents
set showmode                                            " Put a message on last line showing edit mode
set showcmd                                             " Show partial commands in the last line of the screen
" set visualbell
set hidden                                              " you can change buffers without saving
set cursorline                                          " Highlight current row
" set cursorcolumn                                      " Highlight current column
" set ttyfast                                             " Improves smoothness w/ multiple windows
set textwidth=79
" set columns=79
set ruler                                               " Show current line, column in status bar
set backspace=indent,eol,start                          " Nothing can stop the backspace!
set number                                              " Turn on line numbers
" set relativenumber
set laststatus=2                                        " Always show status bar (w/ filename)
set notimeout ttimeout ttimeoutlen=200                  " quickly time out on keycodes, but never on mappings
" set history=99999                                       " Remember 1000 lines of command
set undoreload=10000                                    " Save whole buffer for undo when reloading it
set undofile                                            " Specify new locate for vim7.3 persistent undo file
set undodir=~/.vim/undo                                 " Put undo history into ~/.vim/.undo
set cpoptions+=J
set backup                                              " Turn backups on
set backupdir=~/.vim/backup                             " Where to keep backup files
set directory=~/.vim/tmp                                " Where to keep swap files
set list listchars=tab:>-,trail:.,extends:>,precedes:<  " Show tabs as >- and trailing space as ~
set shell=/usr/local/bin/zsh
set lazyredraw                                          " Don't redraw screen when executing macros/untyped cmds
set matchtime=2
set showbreak=↪
set splitbelow splitright                               " Use sane window splitting. To right and below
set fillchars=diff:⣿
set notimeout ttimeout ttimeoutlen=500
set autoread                                            " Automatically read file when changed outside vim
set title                                               " Title of window set to value of 'titlestring'
set mouse=a                                             " Use mouse everywhere
set noerrorbells                                        " Don't make noise
set clipboard+=unnamed                                  " Put contents of unnamed register in system clipboard
set foldmethod=indent                                   " Syntax highlighting items specify folds
set foldlevel=99
set formatoptions=qrn1
set colorcolumn=80                                     " Highlight columsn past 80
set virtualedit+=block
set linebreak
set nostartofline                                       " leave my cursor where it was.
set confirm                                             " dialog to save files
" set visualbell
"set t_vb=
set cmdheight=2
set guifont=In2onsolata\ for\ Powerline\ 10                             " Font
set fileformats=unix,dos,mac                            " Support all three, in that order
" set iskeyword+=_,$,@,%,#                              " none of these are word dividers

" }}}
" Wildmenu Completion -------------------------------- {{{
set wildmenu                                            " Enhanced cmd line completion. Show possible autocomplete matches
set wildmode=longest:full                               " Complete longest match first, first full match, next match, etc.
set wildignore+=*.git                                   " Ignore version control in autocomplete
set wildignore+=*.pyc,*.exe,*.bak,*.tmp                 " Ignore these file extensions

" }}}
" Tabs, spacing, wrapping ---------------------------- {{{
set tabstop=4                                           " Tabs count for 4 spaces
set shiftwidth=4                                        " Use 4 spaces for each step of autoindent
set softtabstop=4                                       " Tabs count for 4 spaces in edit mode
set expandtab                                           " Expand tabs to spaces
set nowrap                                                " Word wrapping on/off
set smarttab                                            " Insert tabs on the start of a line according to shiftwidth, not tabstop
set shiftround                                          " Use multiples of shiftwidth when indenting with < and >
set textwidth=80                                        " Break line after 80 characters (on whitespace only)
set whichwrap=b,s,h,l,<,>,[,]                           " Move freely between files
"set colorcolumn=+1
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set report=0                " : commands always print changed line count.

"  }}}
" Colorscheme ---------------------------------------- {{{
syntax on                                               " Syntax highlighting on
set t_Co=256
set background=dark                                     " Changes highlighting to look better on dark bg
colorscheme solarized

" }}}
" Search and Movement --------------------------------- {{{
set ignorecase                                          " Ignore case in searches...
set smartcase                                           " ...unless caps explicitly specified
set showmatch                                           " Show matching brackets
set incsearch                                           " Jump to search results as they're typed
set hlsearch                                            " Highlight all search matches
set gdefault                                            " Make global flag default when searching
set scrolljump=5                                        " jump 5 lines when running out of screen
set scrolloff=5                                         " Keep 5 lines of context at the top/bottom
set sidescrolloff=5                                     " Keep 5 lines of context at the sides
set virtualedit+=block                                  " Allow cursor to move outside char boundaries(in visual block)A

" }}}
" Misc settings/mappings ----------------------------- {{{

augroup ft_html
    au!
    au BufNewFile,BufRead *.html setlocal filetype=htmldjango shiftwidth=2 softtabstop=2
    au FileType html,jinja,htmldjango setlocal foldmethod=manual " noexpandtab
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>f Vatzf
augroup END

augroup ft_quickfix
    au!
    au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap nonumber norelativenumber
augroup END

augroup ft_python
    au!
    au FileType python setlocal autoindent shiftwidth=4 tabstop=4 sta expandtab textwidth=79 omnifunc=RopeCompleteFunc
augroup END

augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78

    " always open help files in the top split
    au BufWinEnter *.txt if &ft == 'help' | wincmd K | endif
augroup END

augroup ft_django
    au!
    au BufNewFile,BufRead urls.py setlocal nowrap textwidth=0
    au BufNewFile,BufRead urls.py setlocal filetype=python.django
augroup END

" use two space tabs for ruby
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 et

augroup ft_css
    au!
    au FileType css setlocal iskeyword+=- " noexpandtab
    au BufEnter *.css setlocal listchars=tab:·\ ,trail:-
    au BufNewFile,BufRead *.css inoremap <buffer> {<cr> {}<left><cr><tab>.<cr><esc>kA<bs>
augroup END

autocmd BufReadPost fugitive://* set bufhidden=delete

" restart where we were last
autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif

set mousehide                                           " Hide the mouse when typing
map <MouseMiddle> <esc>"*p                              " Paste text without formatting it

" Save when losing focus
" au FocusLost * :wa
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

" Resize vim windows when terminal window is resized
au VimResized * exe "normal! \<C-W>="

" Change leader key to , (instead of \ by default)
let mapleader = ","

let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 2
set wildignore+=*/.git/*

nmap <leader>a <Esc>:Ack!

" <leader><space> clears all highlighting
nnoremap <leader><space> :nohlsearch<cr>

" Use <leader>w to remove all trailing spaces
"   Searches for any number of spaces (\s\+$) and replaces it with nothing (//)
"   The search term still resides in the '/' buffer, so then we clear it ('')
nnoremap <leader>w :%s/\s\+$//g<cr>:let @/=''<cr>

" Use <leader>rt to retab the file with tabstop=4
"   Sets tab width to 4, and then converts all tabs to spaces
nnoremap <leader>rt :set ts=4<cr>:%retab<cr>

" Useful for when 'wrap' is set. Instead of moving to the real next line,
"  j (or k) moves down (or up) to the next *row* of text
nnoremap j gj
nnoremap k gk

" }}}
" Filetype Specifics --------------------------------- {{{
augroup ft_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker foldmarker={{{,}}}
augroup END

" }}}
" Additional mappings -------------------------------- {{{
" map Y to act like D and C , yank until EOL, rather than as yy
map Y y$
" this messes up visual block inserts
" map I i

" let g:syntastic_python_checker_args = '--ignore=E261,E501'
let g:syntastic_auto_jump=0
let g:syntastic_check_on_open=1

let Tlist_Ctags_Cmd='/usr/bin/ctags'

let g:yankring_enabled = 0
let g:yankring_max_history = 100
let g:yankring_paste_using_g = 1
map <leader>p :YRShow<CR>

" Tasklist
map <leader>td <Plug>TaskList

" Gundo
map <leader>g :GundoToggle<CR>

set pastetoggle=<F11>

" Execute python script
" map <f5> :w\|!python %

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" Disabling other
nnoremap <C-W>O :echo "sucker"<CR>
nnoremap <C-W>o :echo "sucka"<CR>
nnoremap <C-W><C-O> :echo "sucks for you"<CR>

cmap w!! w !sudo tee % >/dev/null

" nnoremap ; :

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" }}}
" Misc  ----------------------------------------------- {{{

" Highlight VCS Conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Open a quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen <CR>

" Ack for the last search.
nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b",

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" MiniBuf
let g:miniBufExplSplitBelow=0
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" MiniBufExpl Colors
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg

"let g:syntastic_check_on_open

"let g:flake8_ignore="E501,W293"
"let g:flake8_max_line_length=99
"let g:flake8_cmd="/opt/bin/flake8000"
autocmd FileType python map <buffer> <leader>7 :call Flake8()<CR>
autocmd BufWritePost *.py call Flake8()

au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" http://stackoverflow.com/questions/6726783/changing-default-position-of-quickfix-window-in-vim
autocmd FileType qf wincmd J


" Tab completion
" au FileType python set omnifunc=pythoncomplete#Complete

set completeopt=menuone,longest,preview

let g:netrw_list_hide='\.pyc$'                          " Ignore these filetypes in the regular file tree

" Allow backspacing over autoindent, line breaks and start of insert action
" Filespecific indenting
set showmatch " briefly jump to matching bracket when entering the closing pair

" just in case the host termcap on this machine sucks, give me color.
if &term =~ "xterm" || &term =~ "screen"
    set t_Co=256
    if has("terminfo")
        set t_Sf=[3%p1%dm
        set t_Sb=[4%p1%dm
    else
        set t_Sf=[3%dm
        set t_Sb=[4%dm
    endif
endif

set statusline=%t\ %1*%m%*\ %1*%r%*\ %2*%h%*%w%=%l%3*/%L(%p%%)%*,%c%V]\ [%b:0x%B]\ [%{&ft==''?'TEXT':toupper(&ft)},%{toupper(&ff)},%{toupper(&fenc!=''?&fenc:&enc)}%{fugitive#statusline()}%{&bomb?',BOM':''}%{&eol?'':',NOEOL'}]
"let statusline=' %t %{&mod?(&ro?"*":"+"):(&ro?"=":" ")} %1*|%* %{&ft==""?"any":&ft} %1*|%* %{&ff} %1*|%* %{(&fenc=="")?&enc:&fenc}%{(&bomb?",BOM":"")} %1*|%* %=%1*|%* 0x%B %1*|%* (%l,%c%V) %1*|%* %L %1*|%* %P'

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
highlight ColorColumn ctermbg=DarkGray guibg=#592929
match OverLength /\%80v.\+/

function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
" autocmd BufWritePre * call RemoveTrailingWhitespace()
nnoremap <silent> <leader>tws :call RemoveTrailingWhitespace()<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" autocmd BufWritePost *.py call Pep8()

highlight SpellBad term=underline cterm=underline ctermbg=1

if has("gui_running")
    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif

hi StatusLine cterm=NONE ctermbg=yellow ctermfg=black gui=bold guibg=yellow guifg=black
hi StatusLineNC cterm=NONE ctermbg=lightgrey ctermfg=black gui=bold guibg=#060606 guifg=black

" }}}

py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

set tags=~/mytags
