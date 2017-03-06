" $VIMRUNTIME/filetype.vim matches all JAM*.* files, override it with "set filetype=bjam"
au BufRead,BufNewFile *.jam,*.v2,Jamfile,jamfile,Jamroot,jamroot set filetype=bjam
