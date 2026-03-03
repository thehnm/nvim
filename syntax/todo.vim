if exists("b:current_syntax")
  finish
endif

" ── Completed tasks ───────────────────────────────────────────────────────────
syn match todoCompleted       "^x .*$"
      \ contains=todoCompletedMarker,todoCompletionDate,todoTag,todoDue,todoNote
syn match todoCompletedMarker "^x"                    contained
syn match todoCompletionDate  "\d\{4}-\d\{2}-\d\{2}" contained

" ── Backlog tasks ─────────────────────────────────────────────────────────────
syn match todoBacklog         "^b .*$"
      \ contains=todoBacklogMarker,todoTag,todoDue,todoNote
syn match todoBacklogMarker   "^b"                    contained

" ── Active task priorities (A–F only, at start of line) ──────────────────────
syn match todoPriorityA "^(A)"
syn match todoPriorityB "^(B)"
syn match todoPriorityC "^(C)"
syn match todoPriorityD "^(D)"
syn match todoPriorityE "^(E)"
syn match todoPriorityF "^(F)"

" ── Inline elements ───────────────────────────────────────────────────────────
syn match todoTag  "#\w\+"
syn match todoDue  "due:\d\{4}-\d\{2}-\d\{2}"
syn match todoNote "n:\S\+"

" ── Link to standard groups (theme-agnostic) ──────────────────────────────────
hi def link todoCompleted       Comment
hi def link todoCompletedMarker Keyword
hi def link todoCompletionDate  Comment
hi def link todoBacklog         NonText
hi def link todoBacklogMarker   Special
hi def link todoPriorityA       Error
hi def link todoPriorityB       WarningMsg
hi def link todoPriorityC       Title
hi def link todoPriorityD       Statement
hi def link todoPriorityE       Special
hi def link todoPriorityF       NonText
hi def link todoTag             Type
hi def link todoDue             WarningMsg
hi def link todoNote            String

let b:current_syntax = "todo"
