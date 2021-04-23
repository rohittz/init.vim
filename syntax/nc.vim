syn keyword NCType int32 string float32 bool var func return geti getc getd gets
hi link NCType Type

syn keyword NcConditional if else elif for while
hi link NcConditional Conditional

syn match NcNumber "\<\d\+\>"
hi! link NcNumber Function

syn match NcFloat "\<\d\+.\d\+\>" contains=NcNumber
hi! link NcFloat Type
syn keyword NcBoolType false true nil
hi link NcBoolType Boolean

syn match NcSpecialCharacter "\\[a-zA-Z0-9_'\"\\]\{1}"
hi! link NcSpecialCharacter Special

syn region NcString start="\"" end="\"" contains=NcSpecialCharacter
hi link NcString String

syn region NcSpecialString start="\"" end="\"" contains=NcSpecialCharacter,NcPrintArgument
hi link NcSpecialString String

syn match NcComment "//.*$"
hi! link NcComment Comment

syn region NcPrintArgument start="{" end="}" 
            \contains=NcString,NcCharacter,NcSpecialCharacter,NcNumber,NcFloat,NcFunction,
            \NCType,NcBoolType,NcConditional,NcSpecialString,NcComment
hi link NcPrintArgument Normal

syn match NcFunction "\zs\w\+\ze\s*\n*("
hi link NcFunction Function

syn region NcCharacter start="'" end="'" contains=NcSpecialCharacter
hi link NcCharacter Character
