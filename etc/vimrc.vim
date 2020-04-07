" 常用设置
set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set clipboard+=unnamed

" 按 F2 进入粘贴模式
set pastetoggle=<F2>

" 高亮搜索
set hlsearch

" 使用 jj 进入 normal 模式
inoremap jj <Esc>`^

" 使用 leader+w 直接保存
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>

" sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" 如果没有安装过 vim-plug 则下载安装
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
                \https://gitee.com/lixifun/vim-plug/raw/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
 Plug 'junegunn/vim-easy-align'
 Plug 'scrooloose/nerdtree'
 Plug 'tpope/vim-surround'
call plug#end()

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nmap ,v :NERDTreeFind<cr>
nmap ,g :NERDTreeToggle<cr>

