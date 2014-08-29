aug filetype_ruby
  au!

  " Set tab sizes
  au FileType ruby set shiftwidth=2 softtabstop=2

" Comment out a line
  au FileType ruby :nnoremap <buffer> <localleader>c I#

  " Create a method
  au FileType ruby :iabbrev <buffer> defm def<cr>end<up>

  " Create an if block
  au FileType ruby :iabbrev <buffer> ifs if<cr>end<up>

  " Create an if/else block
  au FileType ruby :iabbrev <buffer> ife if<cr>else<cr>end<up><up>

  " Create an example group
  au FileType ruby :iabbrev <buffer> desce describe do<cr>end<up><right><right><right><right><right>

  " Create a spec
  au FileType ruby :iabbrev <buffer> ite it<cr>end<up><right>

  " These are Ruby files in disguise.
  au BufRead,BufNewFile *.ru,Gemfile,Guardfile set filetype=ruby

  " Remove trailing spaces from Ruby files. God help me if I actually
  " want that trailing space.
  au BufWritePre *.rb :%s/\s\+$//e
aug END

au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,Sharkfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby
au BufRead,BufNewFile {Procfile*} set ft=yaml
au BufRead,BufNewFile *.hamlc set ft=haml
