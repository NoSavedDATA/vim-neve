if exists('b:current_syntax') | finish | endif

" --- Reserved keywords (red) ---
syntax keyword neveRedKeyword import finish main for in while if return ctor break else offby continue


" --- Types ---
syntax match neveAnyType /[a-zA-Z_][a-zA-Z0-9<>_,\[\]]*\s\+[a-zA-Z_][a-zA-Z0-9_]*/ contains=neveAnyTypeType
syntax match neveAnyTypeType /[a-zA-Z_][a-zA-Z0-9<>_]*/ contained nextgroup=neveAnyTypeNotes skipwhite
syntax match neveAnyTypeNotes /[a-zA-Z0-9<>_,\[\]]*/ contained nextgroup=neveAnyTypeName skipwhite
syntax match neveAnyTypeName /[a-zA-Z_][a-zA-Z0-9_]*/ contained 


" --- Classes ---
syntax match neveClass /^\<class\>\s\+[a-zA-Z_][a-zA-Z0-9_]*/ contains=neveClassDef
syntax match neveClassDef /^\<class\>/ contained nextgroup=neveClassName skipwhite
syntax match neveClassName /[a-zA-Z_][a-zA-Z0-9_]*/ contained

" --- Functions ---
syntax match neveFunc /^\s*\<def\s\+[a-zA-Z_][a-zA-Z0-9_]*\s\+[a-zA-Z_][a-zA-Z0-9_]*/ contains=neveFuncDef
syntax match neveFuncDef /\<def\>/ contained nextgroup=neveFuncType skipwhite
syntax match neveFuncType /[a-zA-Z_][a-zA-Z0-9_]*/ contained nextgroup=neveFuncName skipwhite
syntax match neveFuncName /[a-zA-Z_][a-zA-Z0-9_]*/ contained 



" --- Other keywords / operators / booleans / types ---
syntax keyword neveBoolean true false nil
"syntax keyword neveType self float int str bool var tensor list tuple dict
syntax keyword neveAsyncs spawn async asyncs

" --- Numbers ---
syntax match neveNumber "\<\d\+\(\.\d\+\)\?\>"

" --- Operators ---
syntax match neveOperator "[+\-*/=<>!%]\|<-"

" --- Strings ---
syntax region neveString start=+"+ end=+"+ contains=neveEscape
syntax region neveChar start=+'+ end=+'+ contains=neveEscape
syntax match neveEscape "\\." contained

" --- Comments ---
syntax match neveComment "#.*$"

" --- Parenthesis ---
syntax match neveParen /[(){}\[\]]/


syntax cluster neveTop contains=neveRedKeyword,neveBoolean,neveType,neveAsyncs,neveNumber,neveOperator,neveString,neveComment,neveParen,neveFuncDef


" --- Highlight links ---
hi def link neveRedKeyword Type
hi def link neveBoolean Boolean
hi def link neveType Type
hi neveType guifg=#57B6D9 ctermfg=Blue
hi def link neveNumber Number
hi def link neveOperator Operator
hi def link neveString String
hi def link neveChar String
hi def link neveEscape SpecialChar
hi def link neveComment Comment
hi LineNr guifg=#808080 ctermfg=Grey

let b:current_syntax = 'neve'

