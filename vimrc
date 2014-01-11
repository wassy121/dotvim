execute pathogen#infect()
" syntax highlighting, solarized scheme dark
syn on
if has("autocmd")
  filetype plugin indent on
endif
set background=dark
set guifont=Terminus:h11
let g:solarized_italic=0
colorscheme solarized
" Tabs are annoying
set ts=2
set sw=2
set expandtab
" backspace overwrites
set bs=2
set fileformat=unix
" Set mapleader and some custom macros
let mapleader = ","
map <leader>r :so $MYVIMRC<cr>
map <leader>tc :tabnew<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tx :tabclose
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <leader>f :NERDTreeToggle<cr>
" Make gvim look less ridiculous
set guioptions-=e 
set guioptions-=m " turn off menu bar
set guioptions-=T " turn off toolbar
set guioptions-=L " turn off left scrollbar
set guioptions-=l
set guioptions-=r
set guioptions-=R
" Misc options to disable annoying things
set lz
set nobackup
set nowb
set noswapfile
set hidden
set noerrorbells
set visualbell
set t_vb=
set tm=500


" This is for $P4MERGE
func! ToggleHscroll() 
  set wrap! wrap? 
endfunction
" Disable one diff window during a three-way diff
function! DiffToggle(window)
  " Save the cursor position and turn on diff for all windows
  let l:save_cursor = getpos('.')
  windo :diffthis
  " Turn off diff for the specified window (but keep scrollbind) and move
  " the cursor to the left-most diff window
  exe a:window . "wincmd w"
  diffoff
  set scrollbind
  set cursorbind
  exe a:window . "wincmd " . (a:window == 1 ? "l" : "h")
  " Update the diff and restore the cursor position
  diffupdate
  call setpos('.', l:save_cursor)
endfunction
" Toggle diff view on the left, center, or right windows
nmap <silent> <leader>dl :call DiffToggle(1)<cr>
nmap <silent> <leader>dc :call DiffToggle(2)<cr>
nmap <silent> <leader>dr :call DiffToggle(3)<cr>
