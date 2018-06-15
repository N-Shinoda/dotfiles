"==================================================
"   Description: jedi-vim.vim
"   Author: n-shinoda
"   Last Modified: 2018-06-10
"==================================================

" Jedi for python
"NeoBundleLazy "davidhalter/jedi-vim", {
"    \ "autoload": { "filetypes": [ "python", "python3", "djangohtml"] }}

"if ! empty(neobundle#get("jedi-vim"))
"    let g:jedi#auto_initialization = 1
"    let g:jedi#auto_vim_configuration = 1

"    nnoremap [jedi] <Nop>
"    xnoremap [jedi] <Nop>
"    nmap <Leader>j [jedi]
"    xmap <Leader>j [jedi]

"    let g:jedi#completions_command = "<C-N>"
"    let g:jedi#goto_assignments_command = "[jedi]g"
"    let g:jedi#goto_definitions_command = "[jedi]d"
"    let g:jedi#documentation_command = "[jedi]K"
"    let g:jedi#rename_command = "[jedi]r"
"    let g:jedi#usages_command = "[jedi]n"
"    let g:jedi#popup_select_first = 0
"    let g:jedi#popup_on_dot = 0

autocmd FileType python setlocal completeopt-=preview
