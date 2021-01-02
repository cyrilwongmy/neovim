" ===
" === Editor behavior
" ===
set exrc
set secure
set number
set relativenumber
set cursorline
set hidden
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set t_Co=256

let mapleader=" "


filetype plugin on
syntax on
set number
set pastetoggle=<F2>
set hlsearch
exec 'nohlsearch'
set foldmethod=indent
" save and quite
noremap S :w<CR>
noremap Q :q<CR>

noremap n i
noremap N I
noremap i k
noremap k j
noremap j h

noremap I 5k
noremap K 5j
noremap W 5w
noremap B 5b

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Enter normal mode in insert mode
inoremap jj <ESC>`^

" window management
noremap <LEADER>w <C-w>w
noremap <LEADER>i <C-w>k
noremap <LEADER>k <C-w>j
noremap <LEADER>j <C-w>h
noremap <LEADER>l <C-w>l

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap si :set splitbelow<CR>:split<CR>
noremap sl :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sj :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>


" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tj :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmj :-tabmove<CR>
noremap tml :+tabmove<CR>

cnoremap w!! w !sudo tee % > /dev/null


" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Searching
" ===
noremap - Nzz
noremap = nzz


" Git
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>


call plug#begin()

Plug 'mhinz/vim-startify'

Plug 'yggdroot/indentline'
Plug 'jiangmiao/auto-pairs'


" Editor 
" Plug 'lyokha/vim-xkbswitch'

" color scheme
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ayu-theme/ayu-vim'
Plug 'tomasiser/vim-code-dark'

" Easy motion
Plug 'easymotion/vim-easymotion'

Plug 'ctrlpvim/ctrlp.vim'

" File manager
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Comment
Plug 'tpope/vim-commentary'

" snippets
Plug 'honza/vim-snippets'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'dkarter/bullets.vim'
" Plug 'iamcco/mathjax-support-for-mkdp'


" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tag
Plug 'liuchengxu/vista.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Vim surround
Plug 'tpope/vim-surround'

call plug#end()

" Theme 
" Ayu
" set termguicolors     " enable true colors support
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
" Ayu

colorscheme codedark
let g:airline_theme = 'codedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
" let g:airline#extensions#tabline#left_sep = '▶'
" let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep = '❯'
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
" let g:airline_left_sep = '▶'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '❯'
" let g:airline_right_sep = '◀'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

let g:XkbSwitchEnabled = 1



" ===
" === Git Gutter
" ===
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
highlight GitGutterAdd    guifg=#b7f7a7 ctermfg=2
highlight GitGutterChange guifg=#b7f7a7 ctermfg=3
highlight GitGutterDelete guifg=#c75265 ctermfg=1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>

" Easy motion
nmap ss <Plug>(easymotion-s2)

" ===
" === NerdTree
" ===
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap ff :NERDTreeToggle<CR>
let NERDTreeMapOpenSplit = "hs"

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }


" ===
" === vim-instant-markdown
" ===
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
let g:instant_markdown_autoscroll = 1


" ===
" === coc.nvim
" ===
set hidden
set updatetime=100
let g:coc_global_extensions = [
	\ 'coc-clangd',
	\ 'coc-vimlsp',
	\ 'coc-snippets']
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-o> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" ===
" === Vista.vim
" ===
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }



" ===
" === Ctrlp
" ===
let g:ctrlp_map = '<c-p>'



" ===
" === Auto switch to English in Normal Mode
" ===
let g:input_toggle = 0
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set timeoutlen=150
autocmd InsertLeave * call Fcitx2en()
autocmd InsertEnter * call Fcitx2zh()

" ===
" === Auto switch to Coc disable when easymotion chagnes buffer content
" === without this, may have diagnostic wrong info.
" ===
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

