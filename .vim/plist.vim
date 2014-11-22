augroup plist
    autocmd!

    autocmd BufReadPre,FileReadPre *.plist set binary

    fun MyBinaryPlistReadPost()
        if getline("'[") =~ "^bplist"
            '[,'!plutil -convert xml1 /dev/stdin -o /dev/stdout

            let b:saveAsBinaryPlist = 1
        endif

        set nobinary

        filetype detect
    endfun

    autocmd BufReadPost *.plist call MyBinaryPlistReadPost()

    autocmd FileReadPost *.plist call MyBinaryPlistReadPost() | let b:saveAsBinaryPlist = 0

    fun MyBinaryPlistWritePre()
        if exists("b:saveAsBinaryPlist") && b:saveAsBinaryPlist
            set binary
            silent '[,'!plutil -convert binary1 /dev/stdin -o /dev/stdout
            
            if v:shell_error | undo | set nobinary | endif
        endif
    endfun

    autocmd BufWritePre,FileWritePre *.plist call MyBinaryPlistWritePre()
    
    fun MyBinaryPlistWritePost()
        if exists("b:saveAsBinaryPlist") && b:saveAsBinaryPlist && !v:shell_error
            undo
            set nobinary
        endif
    endfun
    autocmd BufWritePost,FileWritePost *.plist call MyBinaryPlistWritePost()
augroup END
