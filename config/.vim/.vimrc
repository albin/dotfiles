set nocompatible

" fixes utf-8
if has("multi_byte")
	if &termencoding == ""
		let &termencoding = &encoding
	endif
	set encoding=utf-8
	setglobal fileencoding=utf-8
	"setglobal bomb
	set fileencodings=ucs-bom,utf-8,latin1
endif

set t_Co=256

" cmdhistory
set history=100
set undolevels=1000
set wildmode=list:longest

set ruler		" show the cursor position all the time
set number		" show line numbers
set showcmd		" display incomplete commands
set incsearch	" do incremental searching

" ignore case when searching
set ignorecase
" if you search using anything but lowercase use case sensitivity
set smartcase

" set tabs to the width of 4 spaces
set tabstop=4
set shiftwidth=4

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	color molokai
	syntax on
	set hlsearch
endif

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

set backupdir=~/.vim/backup//
set directory=~//

" Clear search (and still redraw the screen as normal)
nnoremap <silent> <C-L> :let @/=""<CR><C-L>
