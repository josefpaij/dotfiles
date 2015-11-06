" user filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect

au! BufNewFile,BufRead *.applescript    setf applescript
au! BufNewFile,BufRead *.md             setf markdown

augroup END

