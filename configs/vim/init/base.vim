"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
set fileencoding=utf-8
language en_US.UTF-8
set langmenu=en_US.UTF-8

" use Unix as the standard file type
set ffs=unix,dos,mac
set fileformat=unix

" do not keep backups or swapfiles
set nobackup
set nowritebackup
set noswapfile

" centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
try
    set undodir=~/.vim/undo
    set undofile
catch
endtry

" lines of history vim remembers
set history=500

" reread file when changed outside vim
set autoread

" use system clipboard
set clipboard=unnamed

" ignore case when searching
set ignorecase
set smartcase
" do incremental searching i.e. highlight as pattern typed
set incsearch

" use magic for regular expressions
set magic

" enable code folding
set foldmethod=syntax
set foldlevel=99

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"
" Moving around
"

" set number of lines to see above/below cursor when moving around
set scrolloff=7

"
" Display
"

" show the cursor position (line/col no) all the time
set ruler

" highlight search results
set hlsearch

" highlight column(s)
set colorcolumn=80

" height of the command bar
set cmdheight=2

" show matching brackets when cursor hovers over them
set showmatch

" no annoying sounds/sights on errors
set noerrorbells
set novisualbell
set t_vb=

" add extra margin to the left
set foldcolumn=1

" show line numbers
set number

" highlight current line
set cursorline

" display incomplete commands
set showcmd

" always show the status line
set laststatus=2

" format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" wrap text that goes off screen
set wrap

" show trailing spaces
set listchars=trail:.
set list

"
" Whitespace
"

" allow backspacing over everything in insert mode
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" replace tab with spaces, except for makefiles
set expandtab

set smarttab
set autoindent
set smartindent

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" trim trailing whitespace
autocmd BufWritePre * :call TrimWhitespace()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable syntax highlighting
syntax enable

" enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set background=dark
try
    colorscheme monokai-chris
catch
endtry

if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""

" override default leader key for custom commands
let mapleader = ","
let maplocalleader = ","

nnoremap <space> za

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun