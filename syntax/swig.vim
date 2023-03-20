" Vim syntax file
" Language:	SWIG
" Maintainer:	Roman Stanchak (rstanchak@yahoo.com)
" Last Change:	2006 July 25

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C++ syntax to start with
if version < 600
  so <sfile>:p:h/cpp.vim
else
  runtime! syntax/cpp.vim
  unlet b:current_syntax
endif

" SWIG extentions
syn keyword swigDirective %typemap %define %apply %fragment %include %enddef %extend %newobject %name
syn keyword swigDirective %rename %ignore %keyword %typemap %define %apply %fragment %include
syn keyword swigDirective %enddef %extend %newobject %name %rename %ignore %template %module %constant
syn match swigDirective "%\({\|}\)"
syn match swigUserDef "%[-_a-zA-Z0-9]\+"

" From Mr.Kissinger <mrkissinger@cmail.cn> (Mar 20th, 2005)
" https://www.vim.org/account/profile.php?user_id=2977
" syn match 	directive		"^\s*%\(\w\+\|{\|}\)"
" syn match 	macro			"^\s*#\(define\|include\)"
" syn match 	cKeyword		"\(int\|char\|void\|unsigned\|struct\)"
" syn region	comment			start="//" skip="\\$" end="$"

" Default highlighting
if version >= 508 || !exists("did_swig_syntax_inits")
  if version < 508
    let did_cpp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink swigDirective      Exception
  HiLink swigUserDef 		PreProc
  delcommand HiLink
endif

" From Mr.Kissinger <mrkissinger@cmail.cn> (Mar 20th, 2005)
" hi directive	gui=bold guifg='Red'
" " hi macro		gui=bold guifg='Magenta'
" hi cKeyword		gui=bold guifg='DarkGreen'
" hi comment		gui=bold guifg='Blue'
" let b:current_syntax = "c"

let b:current_syntax = "swig"

" vim: ts=8
