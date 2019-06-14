" ALE config
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_options = '--display-cop-names --rails'

let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_options = ''
let g:ale_javascript_eslint_use_global = 1

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'javascript.jsx': ['eslint'],
\ 'typescript': ['eslint'],
\ 'typescript.tsx': ['eslint'],
\ 'ruby': ['rubocop'],
\}

let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'javascript.jsx': ['eslint'],
\ 'typescript': ['eslint'],
\ 'typescript.tsx': ['eslint'],
\ 'ruby': ['rubocop'],
\}

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_disable_lsp = 1
