" Mappings for working with this file.
map <Leader>ev :edit $MYVIMRC<CR>
map <Leader>es :source $MYVIMRC<CR>

" Miscellaneous
set encoding=utf-8
set shellslash
set backspace=indent,eol,start
set guioptions=ac
set hidden
set cpoptions+=$
set lazyredraw
set showcmd
set nobackup
set noswapfile

" Wildmenu
set wildmenu
set wildmode=longest,list

" One space between sentences please.
set nojoinspaces

" Wrap to 72 columns by default
set textwidth=72

" Search
set incsearch
set ignorecase
set smartcase

" Colors and themes
syntax on
if has('gui_running') || &t_Co == 256
    colorscheme wombat256dave
else
    colorscheme elflord
end
if &term =~ "256color" || &term =~ "xterm"
    let &t_SI = "\<Esc>[6 q"
    let &t_EI = "\<Esc>[2 q"
    if exists("&t_SR")
        let &t_SR = "\<Esc>[4 q"
    end
end
if has("x11")
    if system("xdpyinfo|grep 'dimensions:'|tr x ' '|awk '{print $2}'") > 1440
        let &guifont="Noto Mono 11"
    else
        let &guifont="Noto Mono 10"
    end
elseif has("gui_win32")
    let &guifont="Lucida Console:h11"
end

" Tab configuration
set expandtab
set shiftwidth=4
set shiftround
set smarttab
set autoindent

" No noise
set novisualbell
set noerrorbells
if exists('&belloff')
    set belloff=all
endif

" Statusline
set statusline=%m%F%=%y\ %l/%L\ %3v\ U+%04B
set laststatus=2
hi StatusLine guibg=Gray16 guifg=White

" netrw
let g:netrw_banner=0
let g:netrw_silent=1

" Filetypes
filetype on
filetype plugin on
filetype indent on

" C style
set cinoptions+=t0  " don't indent function type
set cinoptions+=l1  " align with case label

" Build
set autowrite
if executable('make')
    set makeprg=make\ -kj$(nproc)
elseif executable('nmake')
    set makeprg=nmake\ -nologo
end

" Spelling
set spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add

" colorcolumn
hi ColorColumn ctermbg=darkgray guibg=darkgray
map <Leader>C :set colorcolumn=80<CR>

" Extras
map <Leader>q :hi Error NONE<CR>
map <Leader>t :silent !ctags -R<CR>
map <Leader>w :nnoremap j gj<CR>:nnoremap k gk<CR>
map <Leader>c :%s/\s\+$//e<CR>

" Crypto (via Enchive)
map <Leader>pe :'<,'>!enchive archive \| base64<CR>
map <Leader>pd :'<,'>!base64 -d \| enchive --agent --pinentry extract<CR>
