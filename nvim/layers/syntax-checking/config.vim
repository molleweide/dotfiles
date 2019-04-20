" ALE config
let g:ale_lint_on_save = 0
let g:ale_fix_on_save = 0
let g:ale_ruby_rubocop_options = '--display-cop-names --rails'

let g:ale_linters = {
\ 'ruby': ['rubocop'],
\}

let g:ale_fixers = {
\ 'ruby': ['rubocop'],
\}

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
