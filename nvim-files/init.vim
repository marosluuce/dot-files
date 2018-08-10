call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript', 'do': 'yarn global add tern' }
Plug 'dag/vim2hs', { 'for': 'haskell' }
Plug 'docunext/closetag.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'ervandew/supertab'
Plug 'iCyMind/NeoSolarized'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'lervag/vimtex', { 'for': 'latex' }
Plug 'lfe-support/vim-lfe', { 'for': 'lfe' }
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'pbogut/deoplete-elm', { 'for': 'elm', 'do': 'yarn global add elm-oracle' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sebastianmarkow/deoplete-rust' , { 'for': 'rust' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-erlang/vim-erlang-compiler', { 'for': 'erlang' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'w0rp/ale'
call plug#end()

let mapleader=","

filetype plugin indent on
syntax on

set number
set hidden
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set cmdheight=1
set winwidth=79
set backspace=2
set clipboard=unnamed
set laststatus=2
set noshowmode
set statusline=%f%m%=%r%y
set noswapfile
set cursorline
set nohlsearch
set autoread
set colorcolumn=80
set inccommand=nosplit

"Map nerdcommenter
map <c-c> <leader>c

"Command shortcuts
nnoremap ; :
ino jj <esc>
cno jj <c-c>

"Fuzzy Find
nmap <c-p> :Files<cr>
nmap <leader>t :Find<cr>
"nmap <leader>t :Ag<cr>
nmap <leader>T :call fzf#vim#ag(expand('<cword>'))<cr>

"Map splits
nmap <silent> <c-k> :wincmd k<cr>
nmap <silent> <c-j> :wincmd j<cr>
nmap <silent> <c-h> :wincmd h<cr>
nmap <silent> <c-l> :wincmd l<cr>

"Setup deoplete tab-complete
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"

"Fix for <C-h>
nmap <bs> <c-w>h

" unmap F1 help
nmap <F1> :echo<CR> imap <F1> <C-o>:echo<CR>

"Toggle nerdtree
map <c-n> :NERDTreeToggle<cr>

"Show trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

autocmd filetype crontab setlocal nobackup nowritebackup

set statusline+=%#warningmsg#
set statusline+=%*

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)

let g:racer_cmd="/Users/nkw/.cargo/bin/racer"

let g:mix_format_on_save = 1
let g:elm_format_autosave = 1
let g:jsx_ext_required = 0
let g:rustfmt_autosave = 1
let g:racer_experimental_completer = 1
let g:deoplete#enable_at_startup = 1

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"""""""""""
" Colors
"""""""""""

set termguicolors
set background=dark
colorscheme gruvbox

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
