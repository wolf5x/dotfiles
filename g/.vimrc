" Launch Config {{{
"runtime! debian.vim
set nocompatible
call pathogen#infect()
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif
" }}}
" Google Plugins {{{
source /usr/share/vim/google/google.vim
" YCM
Glug youcompleteme-google
Glug ultisnips-google
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
" codefmt
Glug codefmt
Glug codefmt-google
"Glug codefmt-google auto_filetypes+=python,
function s:AddCodefmtEqualMapping() abort
  " Replace all the various ={motion} keys to codefmt
  nnoremap <buffer> = :set opfunc=codefmt#FormatMap<CR>g@
  nnoremap <buffer> == :FormatLines<CR>
  vnoremap <buffer> = :FormatLines<CR>
endfunction
augroup mycodefmt
  autocmd FileType c,cpp,proto call s:AddCodefmtEqualMapping()
  autocmd FileType bzl AutoFormatBuffer buildifier
augroup END
" }}}
" Colors {{{
syntax enable           " enable syntax processing
set background=dark
"highlight Error ctermfg=white ctermbg=red guibg=white guibg=red
" }}}
" Format Check {{{
highlight OverLength ctermfg=black ctermbg=yellow guibg=yellow guifg=black
autocmd FileType c,cpp,cc,h match OverLength /\%81v.\+/
" }}}
" Misc {{{
set ttyfast                     " faster redraw
set backspace=indent,eol,start
" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
"set modelines=1
filetype indent on
filetype plugin on
set autoindent
" }}}
" Language Specified Formatting {{{
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 et
autocmd FileType go setlocal ts=8 sts=8 sw=8 noet
autocmd FileType c,cpp,cc,h setlocal ts=2 sts=2 sw=2 et wrap tw=80
" }}}
" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu
"set lazyredraw
set showmatch           " higlight matching parenthesis
set ruler
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
" Folding {{{
"=== folding ===
set foldmethod=syntax   " fold based on indent level
set foldnestmax=10      " max 10 depth
set nofoldenable        " don't fold files by default on open
"nnoremap <space> za
set foldlevelstart=10    " start with fold level of 1
" }}}
" View Shortcuts {{{
"nnoremap j gj
"nnoremap k gk
"nnoremap B ^
"nnoremap E $
"nnoremap $ <nop>
"nnoremap ^ <nop>
nnoremap gV `[v`]
"nnoremap to :tabprevious<cr>
"nnoremap tn :tabnext<cr>
"nnoremap tN :tabnew<space>
"nnoremap tV :vsplit<space>
"onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
"xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
"onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
"xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

"onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
"xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
"onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
"xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
" }}}
" Leader Shortcuts {{{
let mapleader=","
"nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>w :NERDTree<CR>
"nnoremap <leader>u :GundoToggle<CR>
"nnoremap <leader>h :A<CR>
"nnoremap <leader>ev :vsp $MYVIMRC<CR>
"nnoremap <leader>ez :vsp ~/.zshrc<CR>
"nnoremap <leader>sv :source $MYVIMRC<CR>
"nnoremap <leader>l :call ToggleNumber()<CR>
"nnoremap <leader><space> :noh<CR>
"nnoremap <leader>s :mksession<CR>
"nnoremap <leader>a :Ag
"nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
"nnoremap <leader>1 :set number!<CR>
"nnoremap <leader>d :Make!
"nnoremap <leader>r :call RunTestFile()<CR>
"nnoremap <leader>g :call RunGoFile()<CR>
"vnoremap <leader>y "+y
"vmap v <Plug>(expand_region_expand)
"vmap <C-v> <Plug>(expand_region_shrink)
"inoremap jk <esc>
" }}}
" Paste Shortcuts {{{
set pastetoggle=<F2>
" }}}
" Powerline {{{
"set encoding=utf-8
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"set laststatus=2
" }}}
" Mini Buffer Expolorer {{{
"map <Leader>e :MBEOpen<cr>
"map <Leader>c :MBEClose<cr>
map <Leader>t :MBEToggle<cr>
map <Leader>m :MBEFocus<cr>
map <Leader>f :MBEbn<cr>
map <Leader>b :MBEbp<cr>
map <Leader>c :MBEbd<cr>
"" }}}
" CtrlP {{{
"let g:ctrlp_match_window = 'bottom,order:ttb'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
" }}}
" Ultisnips {{{
" Track the engine.
" (for Vundle only)
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
" (for Vundle only)
"Plugin 'honza/vim-snippets'

" Trigge configuration. Do not use <tab> if you use https://github.com/Valloric/mouCompleteMe.
let g:UltiSnipsExpandTrigger = "<nop>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
      return snippet
  else
      return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}
" YouCompleteMe {{{
"let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
"let g:ycm_key_list_previous_completion = ["<C-S-TAB>", '<Up>']
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_server_use_vim_stdout = 1
"let g:ycm_server_log_level = 'debug'
nnoremap <F3> :YcmCompleter GoToDefinitionElseDeclaration<CR>

" }}}
" NERDTree {{{
let NERDTreeIgnore = ['\.pyc$', 'build', 'venv', 'egg', 'egg-info/', 'dist', 'docs']
" }}}
" vim-easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. g=ip)
nmap g= <Plug>(EasyAlign)
let g:easy_align_delimiters = {
\  '\': { 'pattern': '\\',  'left_margin': 2 },
\ }
" }}}
" Syntastic {{{
"let g:syntastic_python_flake8_args='--ignore=E501'
"let g:syntastic_ignore_files = ['.java$']
" }}}
" Tmux {{{
"if exists('$TMUX') " allows cursor change in tmux mode
"    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
"    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif
"" }}}
" MacVim {{{
"set guioptions-=r
"set guioptions-=L
" }}}
" AutoGroups {{{
"augroup configgroup
"    autocmd!
"    autocmd VimEnter * highlight clear SignColumn
"    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
"    autocmd BufEnter *.cls setlocal filetype=java
"    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
"    autocmd BufEnter Makefile setlocal noexpandtab
"    autocmd BufEnter *.sh setlocal tabstop=2
"    autocmd BufEnter *.sh setlocal shiftwidth=2
"    autocmd BufEnter *.sh setlocal softtabstop=2
"augroup END
" }}}
" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Custom Functions {{{
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

function! RunTestFile()
    if(&ft=='python')
        exec ":!" . ". venv/bin/activate; nosetests " .bufname('%') . " --stop"
    endif
endfunction

function! RunGoFile()
    if(&ft=='go')
        exec ":new|0read ! go run " . bufname('%')
    endif
endfunction

function! RunTestsInFile()
    if(&ft=='php')
        :execute "!" . "/Users/dblack/pear/bin/phpunit -d memory_limit=512M -c /usr/local/twilio/src/php/tests/config.xml --bootstrap /usr/local/twilio/src/php/tests/bootstrap.php " . bufname('%') . ' \| grep -v Configuration \| egrep -v "^$" '
    elseif(&ft=='go')
        exec ":!gp test"
    elseif(&ft=='python')
        exec ":read !" . ". venv/bin/activate; nosetests " . bufname('%') . " --nocapture"
    endif
endfunction

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! <SID>CleanFile()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!git stripspace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "r"
      let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction
" }}}
" vim:foldmethod=marker:foldlevel=0
