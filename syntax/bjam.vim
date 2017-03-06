" Vim syntax file
" 
" Language: Boost.Jam 
" Maintainer: Bryce Lelbach <admin@thefireflyproject.us>
" Filenames: *.jam, *.v2, Jamfile, jamfile, Jamroot, jamroot 
"
" Distributed under the Boost Software License, Version 1.0. (See accompanying
" file BOOST_LICENSE_1_0.rst or copy at http://www.boost.org/LICENSE_1_0.txt)

sy clear

sy case match

sy keyword jamCond  if else for switch
sy keyword jamLabel  case default
sy keyword jamKey  actions all in include local module on rule
sy keyword jamAction  bind existing import ignore piecemeal quietly rule
sy keyword jamAction  together updated

" Builtin rules
sy keyword jamBuiltin  ALWAYS BACKTRACE CALLER_MODULE DELETE_MODULE
sy keyword jamBuiltin  DEPENDS ECHO EXIT EXPORT FAIL_EXPECTED GLOB
sy keyword jamBuiltin  IMPORT INCLUDES ISFILE LEAVES LOCATE MATCH NOCARE
sy keyword jamBuiltin  NOTFILE NOUPDATE RMOLD RULENAMES SEARCH SHELL
sy keyword jamBuiltin  TEMPORARY VARNAMES UPDATE W32_GETREG
sy keyword jamBuiltin  W32_GETREGNAMES

" Jambase rules
sy keyword jamRule As Bulk Cc C++ Chmod Clean FDefines File Fincludes
sy keyword jamRule Fortran FQuote GenFile HardLink HdrRule InstallBin
sy keyword jamRule InstallLib InstallMan InstallShell Lex Library
sy keyword jamRule LibraryFromObjects Link LinkLibraries Main
sy keyword jamRule MainFromObjects MakeLocate MkDir Object ObjectC++Flags
sy keyword jamRule ObjectCcFlags ObjectDefines ObjectHdrs Objects RmTemps
sy keyword jamRule Setuid SoftLink SubDir SubDirC++Flags SubDirCcFlags
sy keyword jamRule SubDirHdrs SubInclude Shell Undefines UserObject Yacc

" Jambase pseudotargets
sy keyword jamPseudo alias build-project clean dirs exe file install lib
sy keyword jamPseudo obj shell uninstall use-project using


" Variables
" $(XX), where XX contains no " character
sy match jamVar '\$([^)"]*)'
" $XX where XX does not start with a ( and contains no space, ", or \
sy match jamVar '\$[^( \t"\\][^ \t"\\]*'
" <XX> (a feature)
sy match jamVar '<[^>]*>'


" Strings
" (there are no special escapes like \x01 or \n)
sy match jamStringSpecial "\\." contained
sy cluster jamStringElement contains=jamStringSpecial,jamVar
sy region jamString matchgroup=jamStringStartEnd start='"' end='"' contains=@jamStringElement


" Comments
" (only comments [by bjam standards] if they follow whitespace)
sy match jamComment "\([ \t]\|^\)#.*" contains=jamTodo,jamVar,jamString
sy keyword jamTodo TODO FIXME XXX contained


" Errors
" semicolons can't be preceded or followed by anything but whitespace
sy match jamSemiError "[^ \t];"hs=s+1
sy match jamSemiError ";[^ \t]"he=e-1
" colons must either have whitespace on both sides (separating clauses of
" rules) or on neither side (e.g. <variant>release:<define>NDEBUG)
sy match jamColonError "[^ \t]:[ \t]"hs=s+2
sy match jamColonError "[ \t]:[^ \t]"he=e-2

sy match jamOperator ":\|;"

if !exists("did_bjam_syntax_inits")
  let did_bjam_syntax_inits = 1

  hi link jamOperator Special 

  hi link jamSemiError jamError
  hi link jamColonError jamError

  hi link jamCond Conditional
  hi link jamLabel Label
  hi link jamKey Keyword
  hi link jamAction Keyword
  hi link jamBuiltin Keyword

  hi link jamRule Keyword
  hi link jamPseudo Keyword

  hi link jamVar Identifier

  hi link jamString String
  hi link jamStringSpecial Special

  hi link jamComment Comment
  hi link jamTodo Todo

  hi link jamError Error
endif

let b:current_syntax = "bjam"

" vim: ts=8
