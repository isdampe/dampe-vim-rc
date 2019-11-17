" my filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.sc       setfiletype cpp
    au! BufRead,BufNewFile *.sch       setfiletype cpp
augroup END
