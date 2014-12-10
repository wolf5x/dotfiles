""
" @section Introduction, intro
" @library
" Defines helpers for manipulating C code and other C-like languages.


" Return the number of occurances of "needle" in "haystack"
function! s:CountSubstring(haystack, needle)
  let s = a:haystack
  let n = 0
  let pos = stridx(s, a:needle)
  while pos >= 0
    let s = strpart(s, pos+1)
    let n = n+1
    let pos = stridx(s, a:needle)
  endwhile
  return n
endfunction

""
" Get indent level for c-like syntax on the current line.
"
" Indents according to the following rules:
"   * No indent after 'namespace {'.
"   * If previous line is a java annontation, @xxx, no Indent.
"   * If previous line ends with "(" then indent under previous line + 2
"     shiftwidths.
"   * If previous line contains "<<" at a paren-level of 0, ident the current
"     line to that position (cout << foo\n<< bar).
"   * Otherwise, use built-in cindent rules.
function! clib#GetIndent() abort
  " No indent after namespace or template {
  let prevnonblankline = prevnonblank(v:lnum - 1)
  if prevnonblankline > 0
    if getline(prevnonblankline) =~ '^\s*namespace\>.*{\s*$'
      return indent(prevnonblankline)
    elseif getline(prevnonblankline) =~ '^\s*template\>.*$'
      return indent(prevnonblankline)
    endif
  endif

  " No indent after @Annotation, for Java
  if prevnonblankline > 0
    if getline(prevnonblankline) =~ '^\s*@\S*\s*$'
      return indent(prevnonblankline)
    endif
  endif

  let default_indent = cindent(v:lnum)
  if (v:lnum > 1)
    " Do nothing on complete statements
    if default_indent <= indent(v:lnum - 1)
      return default_indent
    endif

    let prevline = getline(v:lnum - 1)

    if prevline =~ '(\s*$'
      " Vim 7.3.693 and later defines a shiftwidth() function to get the
      " effective shiftwidth value. Fall back to &shiftwidth if the function
      " doesn't exist.
      let l:shiftwidth = exists('*shiftwidth') ? shiftwidth() : &shiftwidth
      return indent(v:lnum - 1) + (2 * l:shiftwidth)
    endif

    let left_shift_pos = stridx(prevline, "<<")
    if left_shift_pos >= 0
      " check if the paren level is 0 at the <<, as a heuristic that we're
      " writing to a stream and not doing a left-shift
      let prefix = strpart(prevline, 0, left_shift_pos)
      if s:CountSubstring(prefix, "(") == s:CountSubstring(prefix, ")")
        return left_shift_pos
      endif
    endif
  endif

  return default_indent
endfunction
