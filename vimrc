syntax on
"set cindent
set smartindent
set autoindent
"set nowrap
set ff=unix
set bg=dark
set ruler
set hlsearch
set backspace=eol,start,indent
set modeline

" Indent settings
set ts=8
set sw=8
set sts=8
set visualbell
set wildmode=longest,list
" set expandtab

" showing dots for trailing spaces
" set list
" set listchars=trail:.

"map <F2> <ESC>:15vs .<CR>:copen<CR><c-w>k
map <F2> <ESC>:!w<CR>:make %<.dvi<CR>
map <F3> <ESC>:!w<CR>:make<CR>
"map <F3> <ESC><c-w>h:q<CR><c-w>j:q<CR>
"map <F3> <ESC>:w<CR>:!gnuplot %<CR>
map <F4> <ESC>:!evince %<.eps<CR>
"map <F5> <ESC>:!update_fig.sh %<.eps<CR>
"map <F5> <ESC>:w<CR>:make<CR>:cwin<CR>
"map <F6> <ESC>:!./%<<CR>
"map <F6> <ESC>:!evince %<.pdf<CR>
map <F6> J$a.<ESC>x
map <F9> I//<ESC>l
map <F12> <ESC>mz1G=G'z

filetype on
au FileType tex setlocal spell spelllang=en_us
map <F7> <ESC>:setlocal spell spelllang=en_us<CR>

map <SPACE> <c-]>
map <TAB> <c-t>

map <c-h> <ESC>:% s///g<LEFT><LEFT><LEFT>

map <c-k> <c-w>k
map <c-j> <c-w>j
map <c-h> <c-w>h
map <c-l> <c-w>l

set csprg=cscope
set csto=0
set cst
set nocsverb

"set tags+=~/linux/tags
"cs add ~/linux/cscope.out ~/linux
if filereadable("./cscope.out")
	cs add cscope.out
endif

set csverb

func! Css( )
	let css = expand("<cword>")
	new
	exe "cs find s ".css
	if getline(1) == " "
	exe "q!"
	endif
endfunc
nmap ,css :call Css( )<cr>


func! Csc( )
	let csc = expand("<cword>")
	new
	exe "cs find c ".csc
	if getline(1) == " "
	exe "q!"
	endif
endfunc
nmap ,csc :call Csc( )<cr>


func! Csd( )
	let csd = expand("<cword>")
	new
	exe "cs find d ".csd
	if getline(1) == " "
	exe "q!"
	endif
endfunc
nmap ,csd :call Csd( )<cr>




func! Cse( )
	let cse = expand("<cword>")
	new
	exe "cs find e ".cse
	if getline(1) == " "
	exe "q!"
	endif
endfunc
nmap ,cse :call Cse( )<cr>


func! Csi( )
	let csi = expand("<cword>")
	new
	exe "cs find i ".csi
	if getline(1) == " "
	exe "q!"
	endif
endfunc
nmap ,csi :call Csi( )<cr>

func! Sts( )
	let st = expand("<cword>")
	exe "sts ".st
endfunc
nmap ,st :call Sts( )<cr>

func! Tj( )
	let st = expand("<cword>")
	exe "tj ".st
endfunc
nmap ,tj :call Tj( )<cr>

if has("autocmd")  
    " try to auto-examine filetype  
    if v:version >= 600  
        filetype plugin indent on  
    endif  
    " try to restore last known cursor position  
    autocmd BufReadPost * if line("'\"") | exe "normal '\"" | endif  
    " autoread gzip-files  
    augroup gzip  
    " Remove all gzip autocommands  
    au!  
  
    " Enable editing of gzipped files  
    " set binary mode before reading the file  
    autocmd BufReadPre,FileReadPre      *.gz,*.bz2 set bin  
    autocmd BufReadPost,FileReadPost    *.gz call GZIP_read("gunzip")  
    autocmd BufReadPost,FileReadPost    *.bz2 call GZIP_read("bunzip2")  
    autocmd BufWritePost,FileWritePost  *.gz call GZIP_write("gzip")  
    autocmd BufWritePost,FileWritePost  *.bz2 call GZIP_write("bzip2")  
    autocmd FileAppendPre               *.gz call GZIP_appre("gunzip")  
    autocmd FileAppendPre               *.bz2 call GZIP_appre("bunzip2")  
    autocmd FileAppendPost              *.gz call GZIP_write("gzip")  
    autocmd FileAppendPost              *.bz2 call GZIP_write("bzip2")  
  
    " After reading compressed file: Uncompress text in buffer with "cmd"  
    fun! GZIP_read(cmd)  
        let ch_save = &ch  
        set ch=2  
        execute "'[,']!" . a:cmd  
        set nobin  
        let &ch = ch_save  
        execute ":doautocmd BufReadPost " . expand("%:r")  
    endfun  
  
    " After writing compressed file: Compress written file with "cmd"  
    fun! GZIP_write(cmd)  
        !mv <afile> <afile>:r  
        execute "!" . a:cmd . " <afile>:r"  
    endfun  
  
    " Before appending to compressed file: Uncompress file with "cmd"  
    fun! GZIP_appre(cmd)  
        execute "!" . a:cmd . " <afile>"  
        !mv <afile>:r <afile>  
    endfun  
    augroup END " gzip  
endif  

" vim-latex
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype ocaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype sh setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype verilog setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
