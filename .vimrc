colorscheme darkblue
"colorscheme sublimemonokai
set number
set wildmode=longest,list,full
set wildmenu


filetype plugin indent on 

set encoding=utf-8
set nocompatible 
syntax enable 

if empty(glob('~/.vim/autoload/plug.vim')) 
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/bundle')
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'scrooloose/syntastic'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
"Plug 'ryanoasis/vim-devicons'
Plug 'jpalardy/vim-slime'
Plug 'bfrg/vim-cpp-modern'
"Plug 'Lokaltog/vim-powerline'
"Plug 'Valloric/YouCompleteMe'
Plug 'neomake/neomake'
Plug 'thinca/vim-quickrun'
call plug#end() 

set encoding=UTF-8


"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
"set rtp +=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
"set laststatus = 2
"set t_Co = 256
" Always show statusline
" set laststatus=2
"
" " Use 256 colours (Use this setting only if your terminal supports 256
" colours)

" set t_Co=256

let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже 

""set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h16 "Это light версия
"set guifont=Menlo\ Regular\ for\ Powerline:h16
"set guifont=Anonymice\ Powerline\:h16
"colorscheme sublimemonokai


set guioptions= "Отключаем панели прокрутки в GUI
set showtabline=0 "Отключаем панель табов (окошки FTW)

"Сам по себе number показывает справа номера строк
""relativenumber - нумерацию строк относительно положения курсора
set number relativenumber "А это гибридный вариант. Протестируйте все

"wrap заставляет переносить строчки без их разделения
""Соответсвенно nowrap рендерит строчки за границами экрана
set wrap linebreak nolist "Данная вариация работает как wrap...
"... но переносит строчки не посимвольно, а по словам
"
""Предыдущий способ известен как soft wrapping
"При желании вы можете заставить Вим насильно разделять...
""... строчки в самом тексте вот так:
set textwidth=80 "Где 80 стоит заменить на нужную вам длину строки

set cursorline "А так мы можем подсвечивать строку с курсором

"Если вы используете обычный терминальный Вим, а не NeoVim, то...
""... для изменения курсора в разных режимах используйте это:
set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей
let &t_SI.="\e[5 q" "SI = режим вставки
let &t_SR.="\e[3 q" "SR = режим замены
let &t_EI.="\e[1 q" "EI = нормальный режим
"Где 1 - это мигающий прямоугольник
""2 - обычный прямоугольник
"3 - мигающее подчёркивание
""4 - просто подчёркивание
"5 - мигающая вертикальная черта
""6 - просто вертикальная черта

"set macligatures "Включает поддержку лигатур в MacVim
"Лучше бы не поддерживал совсем

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz


"Если вы используете обычную qwerty, то поменяте mac на win
set keymap=russian-jcukenmac
""Язык ввода при старте Вима - Английский
set iminsert=0
"Аналогично настраивается режим поиска
"set imsearch=0

"Для обычного Вима


let g:slime_target = "vimterminal"

" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 0
"
" " Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
"
" " Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1
"
" " Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" " (affects both C and C++ files)
let g:cpp_simple_highlight = 1

"set rtp += /usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
"set laststatus = 2

"set t_Co = 256

map <F2><Esc>:w<CR>:!bash f2.sh<CR>
vnoremap <F2> :w<CR>:!bash f2.sh<CR>

