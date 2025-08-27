"Function to easily and safely set : command aliases"
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

"Aliases work best for one command at a time, command! works best for multiple commands"
call SetupCommandAlias("W","w")

"Function to keep cursor where the position was when the buffer is closed by %bd"
function! Bda()
  let line = line('.')
  let col = col('.')
  execute '%bd | e# | bd#'
  call cursor(line, col)
endfunction

command! Bda call Bda()
