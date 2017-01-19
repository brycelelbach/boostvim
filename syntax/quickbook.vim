" Vim syntax file
"
" Language: Quickbook
" Maintainer: Bryce Lelbach <admin@thefireflyproject.us>
" Filenames: *.qbk
"
" Distributed under the Boost Software License, Version 1.0. (See accompanying
" file BOOST_LICENSE_1_0.rst or copy at http://www.boost.org/LICENSE_1_0.txt)

sy clear

sy case match

" Syntactic Elements
sy match qbkBrackets "\[\|\]"

" Comments
sy match qbkComment "\[/\_.\{-}\]"

" Phrase Level Elements
sy match qbkFontStyles  "\[\('\|[*]\|_\|^\|-\)"
sy match qbkReplaceable "\[\~"
sy match qbkQuotations  "\[\"" 

" TODO: this currently sucks
sy match qbkItalic    " /[a-zA-Z0-9]\([A-Za-z0-9]\+\)[a-zA-Z0-9]/[,.?!(;:]"
sy match qbkBold      " [*][a-zA-Z0-9]\([A-Za-z0-9]\+\)[a-zA-Z0-9][*][,.?!(;:]"
sy match qbkUnderline " _[a-zA-Z0-9]\([A-Za-z0-9]\+\)[a-zA-Z0-9]_[,.?!(;:]"
sy match qbkTeletype  " =[a-zA-Z0-9]\([A-Za-z0-9]\+\)[a-zA-Z0-9]=[,.?!(;:]"

if !exists("did_quickbook_syntax_inits")
  let did_quickbook_syntax_inits = 1

  hi link qbkBrackets Special

  hi link qbkComment Comment 

  hi link qbkFontStyles Special
  hi link qbkReplaceable Special
  hi link qbkQuotations Special

  hi link qbkItalic String
  hi link qbkBold String
  hi link qbkUnderline String
  hi link qbkTeletype String
endif

let b:current_syntax = "quickbook"

" vim: ts=8
