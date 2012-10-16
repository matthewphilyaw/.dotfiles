call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" colorscheme ironman 
colorscheme calmar256-dark
syntax enable

set nobackup
set noswapfile
set nocompatible
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set foldmethod=syntax
set nofoldenable
set undolevels=1000
set pastetoggle=<F2>
set ruler
set showcmd
set number
set hidden
set incsearch
" By default the search will ignore case
set ignorecase
" If the search phrase is of mixed case then the search
" will be case sensitive
set smartcase
set hlsearch 
set tags=tags;/
set history=1000
set nowrap
set wildignore+=*.class,*.beam,*.jar,*.git
set listchars=tab:--,trail:~,extends:>,precedes:<
set list

if has('autocmd')
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd bufwritepost _vimrc source $MYVIMRC
"    autocmd VimEnter * NERDTree

    " VIM comes with 'batteries included' you could say Including
    " these auto-completion scripts for web Development
    " These are located in your vimruntime directory
    " check ':help vimruntime'
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType sql set omnifunc=sqlcomplete#Complete
    autocmd FileType c set omnifunc=ccomplete#Complete
    autocmd FileType ruby set omnifunc=rubycomplete#Complete
    autocmd VimEnter * wincmd p
    autocmd BufNewFile,BufRead *.coffee set ft=coffee
    autocmd BufNewFile,BufRead *.go set ft=go
endif

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif

    set encoding=utf-8

    setglobal fileencoding=utf-8 bomb

    set fileencodings=ucs-bom,utf-8,latin1
endif 

filetype on
filetype plugin on
filetype indent on

imap jj <Esc>
let mapleader=","
let g:vimroom_sidebar_height = 0
let g:vimroom_width = 80
let g:SCMDiffCommand = 'git'
let g:CommandTCancelMap='<C-x>'

" VimClojure
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = $HOME . "/.vim/lib/vimclojure-nailgun-client/ng"

" Paredit
let g:paredit_mode = 0

" Remap the tab key to do autocompletion or 
" indentation depending on the context 
" from http://www.vim.org/tips/tip.php?tip_id=102
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

nnoremap <space> za<space>
nnoremap <cr> :noh<cr><cr>
map <silent> <leader>v <plug>VimroomToggle<cr>
noremap <leader>b :make<cr>
nnoremap ; :

no <C-h> <C-w>h  
no <C-j> <C-w>j
no <C-k> <C-w>k
no <C-l> <C-w>l
no <C-n> :tabnew<cr>    
no <C-tab> :tabNext<cr>

" Lets us quickly search through all files in the current directory
" recursively for the word the cursor is on.
map <leader>gr :grep -r <cword> *<cr>
" Recursively search for current word in the directory the file 
" you are editing exists and down.
map <leader>gd :grep -r <cword> %:p:h/*<cr>
map <leader>f :NERDTreeToggle<cr>
map <leader>c :TagbarToggle<cr>
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>


" Search up the path for a proj.vim file so we can wire in
" extra settings on a per project basis.
let proj_settings=findfile('proj.vim', '.;/')
let NERDTreeIgnore=['\.pyc$', '\.beam$']
let t_Co=256 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

if filereadable(proj_settings)
    source `=proj_settings`
endif
