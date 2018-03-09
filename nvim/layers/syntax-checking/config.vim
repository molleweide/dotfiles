" ALE config
let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_options = '--display-cop-names --rails'

let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'ruby': ['rubocop'],
\}

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'

let g:airline#extensions#ale#enabled = 1
