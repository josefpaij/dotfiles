""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " PLUGIN MANAGER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()

        " let Vundle manage Vundle, required
        Plugin 'gmarik/Vundle.vim'

        " additional plugins here
        Plugin 'kien/ctrlp.vim' " Control-P
        Plugin 'altercation/vim-colors-solarized'
        Plugin 'chriskempson/vim-tomorrow-theme'
        Plugin 'morhetz/gruvbox'
        Plugin '29decibel/codeschool-vim-theme'
        Plugin 'scrooloose/syntastic'
        " Plugin 'file:///Users/josefpaij/.vim/bundle/Omnisharp'
        Plugin 'tpope/vim-dispatch'
        Plugin 'ervandew/supertab'
        Plugin 'vim-scripts/applescript.vim'
        Plugin 'vim-latex/vim-latex'
        Plugin 'marijnh/tern_for_vim'
        " Plugin 'Slava/tern-meteor'
        Plugin 'tpope/vim-unimpaired'
        Plugin 'ervandew/screen'
        Plugin 'JulesWang/css.vim'
        Plugin 'genoma/vim-less'
        Plugin 'tpope/vim-surround'
        " Plugin 'Valloric/YouCompleteMe'
        
        " All Plugins must be added before the following line
        call vundle#end()           " required
        " run PluginInstall to install plugins
        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " BASIC SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

        " YouCompleteMe
        " let g:ycm_global_ycm_extra_conf = \"~/.vim/.ycm_extra_conf.py\"
        " let g:ycm_key_list_select_completion=[]
        " let g:ycm_key_list_previous_completion=[]

        filetype plugin indent on " For eclim plugin to work

        set nocompatible "Don't need compatibility with Vi
        set hidden " Switch between buffers without saving
        set ruler " Display current cursor position in the lower right corner
        set cmdheight=1
        set tags=./tags,tags;$HOME " Search for tags up folders back to my home directory
        syntax on " Enable syntax highlighting
        " Stop searching through node-module folders with CommandT
        set wildignore+=*/node_modules/*
        set wildignore+=*.pyc
        set wildignore+=*.swp,*.meta
        " No need for backup or swap files
        set nobackup
        set noswapfile
        " set autowrite " Write the old file out when switching between files
        set timeout timeoutlen=1000 ttimeoutlen=100 " Lower lag after typing <Leader>
        " Tab stuff
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
        set autoindent
        set smartindent
        set expandtab " convert tab to spaces
        set smarttab " Insert tabs on the start of a new line according to shift width, not tabstop
        set showcmd " Show command in bottom right portion of screen
        set noshowmatch " Show matching parenthesis
        set number " Show line numbers
        set laststatus=2 " Always show the status line
        set linespace=2 " Prefer a slightly higher lineheigt
        " keep Vim from adding new lines
        set wrapmargin=79
        " Better line wrapping
        set textwidth=79
        set formatoptions=qrn1
        set incsearch " Set incremental searching
        set nohlsearch " Highlight searching
        " case insensitive search
        set ignorecase smartcase
        " Word-wrap stuff
        set wrap
        set linebreak
        set nolist  " list disables linebreak
        set formatoptions+=l " keep old textwidth settings
        set mousehide
        set visualbell " Use visual bell instead of audio bell 
        set wildmenu " Completions for help
        " Session settings
        set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
        set backspace=indent,eol,start
        map <leader>sp :set paste<cr>
        map <leader>np :set nopaste<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " LaTeX Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

        set grepprg=grep\ -nH\ $*
        let g:tex_flavor='latex'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Compiling [and Running]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

        " shortcut for printing .md to .pdf
        map <leader>b :!notes % <cr><cr>

        " shortcut for building and running c program
        map <leader>cc :w <bar> !gcc -o c_test % && ./c_test -v <cr>

        " shrotcut for building and running java program
        map <leader>cj :w <bar> Java <cr> "!javac % && java $(remove_extension.sh %) <cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Sytastic and OmniSharp functionality
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


        " set completefunc=syntaxcomplete#Complete
        set completeopt=longest,menuone

        " Super tab settings - next 4 lines
        let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
        let g:SuperTabClosePreviewOnPopupClose = 1
        let g:SuperTabDefaultCompletionTypeDiscovery = ['&omnifunc:<c-x><c-o>']
        let g:SuperTabContextDefaultCompletionType = '<c-x><c-o>'

        "don't autoselect first item in omnicomplete, show if only one item (for preview)
        "remove preview if you don't want to see any documentation whatsoever.
        " setlocal omnifunc=OmniSharp#Complete

        set splitbelow

   "    let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

   "    augroup omnisharp_commands
   "        autocmd!
   "             "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
   "        autocmd FileType cs setLocal omnifunc=OmniSharp#Complete
   "        
   "        "Builds can also run asynchronously with vim-dispatch installed
   "        autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync
   "    
   "        " automaticaly syntax check on events (TextChanged requires Vim 7.4)
   "        autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
   "        
   "        " The following commands are contextual, based on the current cursor
   "        " position.
   "        autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
   "        autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
   "        autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
   "        autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
   "    
   "        " Contextual code actions (requires CtrlP)
   "        autocmd FileType cs nnoremap <leader><space> :OmniSharpGetCodeActions<cr>

   "        " Load the current .cs file to the nearest project
   "        autocmd FileType cs nnoremap <leader>tp :OmniSharpAddToProject<cr>
   "    
   "    augroup END
        

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Eclim (Eclipse + Vim)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let g:EclimCompletionMethod = 'omnifunc'

        augroup eclimCommands
            autocmd!
            " Import the class under the cursor with <leader>i (:h mapleader)
            autocmd FileType java nnoremap <silent> <buffer> <leader>i :JavaImport<cr>

            " Search for the javadocs of the element under the cursor with <leader>d
            autocmd FileType java nnoremap <silent> <buffer> <leader>ds :JavaDocSearch -x declarations<cr>

            " Perform a context sensitive search of the element under the cursor with <enter>
            autocmd FileType java nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
        augroup END

        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " CtrlP Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

        let g:ctrlp_working_path_mode = 'ra'
        let g:ctrlp_prompt_mappings = {
          \ 'PrtSelectMove("j")':   ['<c-J>', '<down>'],
          \ 'PrtSelectMove("k")':   ['<c-K>', '<up>'],
          \ }
        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " attempt at Gary Bernhardt's window flow
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        set winwidth=130
        set winheight=25
        set winminwidth=70
        set winminheight=5
        set scrolloff=3 " keep more context when scrolling off the end of a buffer
        set foldmethod=manual " Turn off folding
        set nofoldenable


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%4l,%02c%03V%) " Gary
        "set statusline=%<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P " tpope

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Misc key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Change leader
        let mapleader=','
        nnoremap <leader><leader> <c-^>
        nnoremap <c-c> <esc>

        "Saves time; maps the spacebar to colon
        nmap ; :
        " Easy clearing of search
        nmap <silent> <leader>/ :nohlsearch<CR>
        " Apply vimrc changes
        nmap <silent> <leader>sv :so $MYVIMRC<CR>
        " Apply vimrc changes
        nmap <silent> <leader>ev :sp $MYVIMRC<CR><c-w>K<c-w>_

        "shortcut for Omni Complete
        " Omni Complete function
        " set omnifunc=syntaxcomplete#Complete
        
        " Hard-wrap paragraphs of text
        nnoremap <leader>q gqip
        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " MOVE ARROUND SPLITS WITH <c-hjkl>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        nnoremap <c-j> <c-w>j<c-w>_
        nnoremap <c-k> <c-w>k<c-w>_
        nnoremap <c-h> <c-w>h<c-w>_
        nnoremap <c-l> <c-w>l<c-w>_

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        cnoremap %% <C-R>=expand('%:h').'/'<cr>
        map <leader>e :edit %%
        map <leader>v :view %%
        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " PUT DEVELOPMENT/MAC PATH IN COMMAND LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        nmap <leader>dm :e ~/_Creative/Development/Mac/
        cmap <leader>dm ~/_Creative/Development/Mac/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " this colorscheme for non GUI
        " solarized options

        "let g:solarized_termcolors=256
        "let g:solarized_contrast = 'high'
        "let g:solarized_visibility = 'high'
        colorscheme Tomorrow-Night
        set background=light
        

        " Set font type and size
        set guifont=Iconsolata:h16

        " Set colorscheme for gui
        if has('gui_running')
            colorscheme githur
            "set bg=dark
        endif
        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " LaTeX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " section jumping for LaTeX
        " noremap <buffer> <silent> ]] :<c-u>call TexJump2Section( v:count1, '' )<CR>
        " noremap <buffer> <silent> [[ :<c-u>call TexJump2Section( v:count1, 'b' )<CR>
        " function! TexJump2Section( cnt, dir )
        "  let i = 0
        "  let pat = '^\\\(part\|chapter\|\(sub\)*section\|paragraph\)\>\|\%$\|\%^'
        "  let flags = 'W' . a:dir
        "  while i < a:cnt && search( pat, flags ) > 0
        "    let i = i+1
        "  endwhile
        "  let @/ = pat
        " endfunction
        
        " change default plugin for filetype tex
        " let g:tex_flavor = latex
