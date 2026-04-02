if exists('b:current_syntax') | finish | endif

" --- Reserved keywords (red) ---
syntax keyword nskRedKeyword import finish main for in while if return ctor break else offby


" --- Types ---
syntax match nskAnyType /[a-zA-Z_][a-zA-Z0-9<>_,\[\]]*\s\+[a-zA-Z_][a-zA-Z0-9_]*/ contains=nskAnyTypeType
syntax match nskAnyTypeType /[a-zA-Z_][a-zA-Z0-9<>_]*/ contained nextgroup=nskAnyTypeNotes skipwhite
syntax match nskAnyTypeNotes /[a-zA-Z0-9<>_,\[\]]*/ contained nextgroup=nskAnyTypeName skipwhite
syntax match nskAnyTypeName /[a-zA-Z_][a-zA-Z0-9_]*/ contained 


" --- Classes ---
syntax match nskClass /^\<class\>\s\+[a-zA-Z_][a-zA-Z0-9_]*/ contains=nskClassDef
syntax match nskClassDef /^\<class\>/ contained nextgroup=nskClassName skipwhite
syntax match nskClassName /[a-zA-Z_][a-zA-Z0-9_]*/ contained

" --- Functions ---
syntax match nskFunc /^\s*\<def\s\+[a-zA-Z_][a-zA-Z0-9_]*\s\+[a-zA-Z_][a-zA-Z0-9_]*/ contains=nskFuncDef
syntax match nskFuncDef /\<def\>/ contained nextgroup=nskFuncType skipwhite
syntax match nskFuncType /[a-zA-Z_][a-zA-Z0-9_]*/ contained nextgroup=nskFuncName skipwhite
syntax match nskFuncName /[a-zA-Z_][a-zA-Z0-9_]*/ contained 



" --- Other keywords / operators / booleans / types ---
syntax keyword nskBoolean true false nil
"syntax keyword nskType self float int str bool var tensor list tuple dict
syntax keyword nskAsyncs spawn async asyncs

" --- Numbers ---
syntax match nskNumber "\<\d\+\(\.\d\+\)\?\>"

" --- Operators ---
syntax match nskOperator "[+\-*/=<>!%]\|<-"

" --- Strings ---
syntax region nskString start=+"+ end=+"+ contains=nskEscape
syntax region nskChar start=+'+ end=+'+ contains=nskEscape
syntax match nskEscape "\\." contained

" --- Comments ---
syntax match nskComment "#.*$"

" --- Parenthesis ---
syntax match nskParen /[(){}\[\]]/


syntax cluster nskTop contains=nskRedKeyword,nskBoolean,nskType,nskAsyncs,nskNumber,nskOperator,nskString,nskComment,nskParen,nskFuncDef


" --- Highlight links ---
hi def link nskRedKeyword Type
hi def link nskBoolean Boolean
hi def link nskType Type
hi nskType guifg=#57B6D9 ctermfg=Blue
hi def link nskNumber Number
hi def link nskOperator Operator
hi def link nskString String
hi def link nskChar String
hi def link nskEscape SpecialChar
hi def link nskComment Comment
hi LineNr guifg=#808080 ctermfg=Grey

let b:current_syntax = 'nsk'

