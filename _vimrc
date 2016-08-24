filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note to install vundles use :
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" Note : TO install vimrc in debian apt-get otherwise get the vba

set nocompatible               " be iMproved
filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

  Bundle 'The-NERD-Commenter'
  Bundle 'ctrlp.vim'
  Bundle 'vimwiki'
  Bundle 'plasticboy/vim-markdown'
"  Bundle 'vim-orgmode'
"  Bundle 'LaTeX-Suite-aka-Vim-LaTeX'  
  Bundle 'gmarik/vundle'
"  Bundle 'UltiSnips'
"  Bundle 'VimOutliner'
"  Bundle 'vimoutliner-colorscheme-fix'
"  Bundle 'Command-T' " Replaced with ctrlp.vim
"  Bundle 'Color-Sampler-Pack'
"  Bundle 'SuperTab-continued.'
"  Bundle 'LaTeX-Box'
"  Bundle 'TeX-PDF'
"  Bundle 'pyflakes.vim'
  "Bundle 'pep8--Yusuke'
  "Bundle 'pep8--Driessen'
"  Bundle 'pep8'
"  Bundle 'https://github.com/Rip-Rip/clang_complete.git'
"  Bundle 'flymaker'
"  Bundle 'AsyncCommand'
  "conque_term
  "errormerker
  "filebrowser
  "imaps
  "libList
  "project
  "remoteOpen
  "SyntaxFolds
  "a
  "latex-box
  "omnicppcomplete
  "Bundle 'latextags'
  "checksyntax


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Set current directory to always be the directory we are in
"  Set this as a function so we can enable it for certain types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! AlwaysHere()
if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 filetype plugin indent on     " required! 
 " or 
 " filetype plugin on          " to not use the indentation settings set by plugins

 "
 " Brief help
 "
 " :BundleInstall  - install bundles (won't update installed)
 " :BundleInstall! - update if installed
 "
 " :Bundles foo    - search for foo
 " :Bundles! foo   - refresh cached list and search for foo
 "
 " :BundleClean    - confirm removal of unused bundles
 " :BundleClean!   - remove without confirmation
 "
 " see :h vundle for more details

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Windows only settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Platform
function! MySys()
	if has("win32") || has("win64")
		return "windows"
	elseif has("mac")
		return "mac"
	else
		return "linux"
	endif
endfunction

"  You use the above like this
" if MySys() == "mac"
" 	map <D-y> <C-y>
"endif

if MySys() == "windows"
source $VIMRUNTIME/mswin.vim
behave mswin
endif

if MySys() == "linux"
source $VIMRUNTIME/mswin.vim
behave mswin
endif

syntax on
filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Generic Settings
" I nicked this from soneone on the web and then adapted it myself
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set noswapfile      "Set this if you have sensitive stuff in there
set swapfile

set nocompatible    " use vim defaults
"set ls=2            " allways show status line
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
"set scrolloff=3     " keep 3 lines when scrolling
"set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
"set visualbell "Also turn of beeping
set novisualbell    " turn off visual bell
set t_vb=    " turn off error beep/flash This includes that annoying bell every time I press escape unnecessarily
"set vb t_vb=    " Turn off flashing when hitting botom of screen
set nobackup        " do not keep a backup file
"set number          " show line numbers
"set ignorecase      " ignore case when searching 
set noignorecase   " don't ignore case
set title           " show title in console title bar
"set ttyfast        " smoother changes
"set ttyscroll=0    " turn off scrolling, didn't work well with PuTTY
"set modeline        " last lines in document sets vim mode
"set modelines=3     " number lines checked for modelines
"set shortmess=atI   " Abbreviate messages
"set nostartofline   " don't jump to first character when paging
"set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
"set viminfo='20,<50,s10,h
"
"set autoindent     " always set autoindenting on
set smartindent        " smart indent
"set cindent            " cindent
set noautoindent
"set nosmartindent
set nocindent   
set autowrite      " auto saves changes when quitting and swiching buffer
"set expandtab      " tabs are converted to spaces, use only when required
"set nowrap         " don't wrap lines
set wildignore =*.o,*.obj,*.orig  " This shows what files to ignore in file listings.  I use it for Command-T
"set browsedir=buffer " Makes the GUI file open dialog use current directory

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Makefiles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <c-m> <esc>:make<CR>
" Make Ctrl M = make unless redefined later on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show marks options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:showmarks_enable=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Project Add-ons
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:proj_flags = 'gimstc'
" I'm loosing the g as it maps to F12 and I now want that for my new Project
" replacement
let g:proj_flags = 'imstc'
filetype plugin indent on

"cmap myproj bwipe<CR>:Project project_file <CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My Project configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:myprojects_file = getcwd() ."/_myprojectFile"
let g:myprojects_auto_close = 1 " variable close the panel when a file is open, default is 0. 
let g:myprojects_auto_open = 0 " variable open automaticaly myprojects.vim at vim startup. 
map <F12> :MyProjectsToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-T now CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"noremap <c-k> <esc>:CommandT<CR>
noremap <c-k> <esc>:CtrlP<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the spelling dictionary to be English UK
setlocal spell spelllang=en_gb

" Ctrl q to show spellings
map <c-q> z=

" zg now sa Adds to dictionary
map <leader>sa zg

" zg now sA Adds to dictionary for this session only
map <leader>sA zG

" z= shows suggestions now use s?
map <leader>s? z=

" Toggle spelling
map <LocalLeader>ss :set spell!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" ErrorMarker.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This sets errormarker to distinguish between errors and warnings for gcc
"let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" NERDCOMMENTER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Ctrl-/ to toggle comments
"map <c-_> <plug>NERDCommenterToggle
map <c-l> <plug>NERDCommenterToggle


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Latex only
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For this to work properly you need to be in the directory with the makefile
" in.
let g:tex_flavor = "latex" " This is the default tex style

function! SetLatex()
	map <c-m> :make <CR>  " default make
	set makeprg=make
	set errorformat=%f:%l:\ %m 
	"autocmd FileType tex set makeprg=[[\ -f\ Makefile\ ]]\ &&\ make\ \\\|\\\|\ make\ -C\ ..
	"set makeprg=[[\ -f\ Makefile\ ]]\ &&\ make\ \\\|\\\|\ make\ -C\ ..
	set spell
	set wildignore =*.o,*.obj,*.orig,*.aux,*.bbl,*.blg,*.log,*.bak,tags,.*,*.fig,*.png,*.pdf,*.ps,*.dvi,*.eps,*.glo,*.toc,*.acn,*.ist,*.lot,*.lof,*.glo,*.tdo,*.gz   " This shows what files to ignore in file listings.  I use it for Command-T

	let g:ctrlp_working_path_mode = 'r'
	"let g:ctrlp_user_command = 'find . -name "*.tex" -type f'


	let g:tex_pdf_map_keys = 0 " For Tex-PDF stop other mappings being set.
	" Change the default type to be pdf
	"
	" Automaticly re-creat ctags everytime the file is saved
	"au BufWritePost *.tex silent! !ctags *.tex &
	au BufWritePost *.tex silent! !ctags -R --sort=yes &
endfunction

autocmd FileType tex call SetLatex()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"reload vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"cmap vimrc o $MYVIMRC <CR>
"cmap vimrcs source $MYVIMRC <CR>


if has("gui_running")
	"See ~/.gvimrc
"  Ive stolen this and not adapted it yet
	"set lines=50       " height = 50 lines
	"set columns=100        " width = 100 columns
	"  This is mine though
	"  set guifont=Inconsolata 
	set guifont=consolas 
	"colorscheme nuvola    " use this color scheme
	set background=light        " adapt colors for background

	"set guifont=courier10pitcj
	"colorscheme Autumn    " use this color scheme

else
	colorscheme elflord    " use this color scheme
	set background=dark        " adapt colors for background
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"File formats
au BufNewFile,BufRead  *.pl    set filetype=prolog
au BufNewFile,BufRead  *.pro    set filetype=prolog
au BufNewFile,BufRead  *.nxc    set filetype=nxc
au BufNewFile,BufRead  *.txt    set filetype=vo_base
au BufNewFile,BufRead  *.AcDiary    set filetype=vo_base
au BufNewFile,BufRead  *.otl    set filetype=vo_base
"au! BufRead,BufNewFile *.txt setfiletype vo_base
"au BufNewFile,BufRead  *.diary    set filetype=diary

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   My nxc stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType nxc set efm=%E#\ Error:\ %m,%CFile\ \"%f\"\ ;\ line\ %l,%C%.%# 
autocmd FileType nxc map <c-m> :make download<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   My  c++ stuff should maybe get moved but not sure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""i
autocmd FileType cpp set foldmethod=syntax  " Set folding to be code based


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   My  python stuff 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""i

function! SetPython()
     set tabstop=4
     set softtabstop=4
     set shiftwidth=4
     set textwidth=80
     set smarttab
     set expandtab
endfunction
autocmd FileType python call SetPython()


autocmd FileType cpp set foldmethod=syntax  " Set folding to be code based

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Vim outliner
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType vo_base set noswapfile
autocmd FileType vo_base call AlwaysHere()

:nnoremap <F5> "=strftime("\t\t\tDay : %A - %d/%m/%y\n")<CR>P
:nnoremap <F6> "=strftime("\t\t\t[%H:%M] @POM : ")<CR>P
:nnoremap <F7> "=strftime("[%H:%M] ")<CR>P
:nnoremap <F8> "=strftime("\t\t\t%a %d/%m/%y %H:%M @")<CR>P
:nnoremap <F9> "=strftime("\tWeek : %A - %d/%m/%y\n\t\tTARGETS\n\t\tREVIEW\n\t\tDAYS")<CR>P

map <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> " Note it is also possible to set for only c++ and to do macros

set completeopt=longest,menuone,preview  " long sets the longest common text, menuone always show even if only 1
"let g:SuperTabLongestHighlight=1
let g:SuperTabLongestEnhanced=1
"inoremap <expr> <CR> pumvisible() ? "\<C-n>" : "\<CR>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   My Menu Items
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:amenu MyShortcuts.LoadVimRC :e $MYVIMRC <CR>
:amenu MyShortcuts.SourceCurentFile :source % <CR>
:amenu MyShortcuts.UltiSnipsEdit :UltiSnipsEdit <CR>
:amenu MyShortcuts.UltiSnipsReset :UltiSnipsReset <CR>
:amenu MyShortcuts.SaveMyVimSession :mksession! ~/phd.vim <CR>
:amenu MyShortcuts.UpdateBundles :BundleInstall! <CR>
:amenu MyShortcuts.CDCurrentDir :lcd %:p:h:gs/ /\\ / <CR>
:amenu MyShortcuts.CommandTFlush :CommandTFlush<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Ultimate Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.vim/ultisnips_rep 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Academic Diary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au BufNewFile,BufRead  *.AcDiary    set filetype=acdiary
"au! BufRead,BufNewFile *.AcDiary setfiletype acdiary

"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
