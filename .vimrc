      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " PLUGIN MANAGER
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      
      " run PluginInstall to install plugins
      
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
          Plugin 'VundleVim/Vundle.vim'
      
      " Linting
          "Asyncronous Lint Engine
          Plugin 'w0rp/ale'

          " Plugin 'scrooloose/syntastic'

      " ES6 syntax
          Plugin 'mxw/vim-jsx'
          Plugin 'pangloss/vim-javascript'
          Plugin 'mtscout6/syntastic-local-eslint.vim'
      
      " Colors
          Plugin 'junegunn/seoul256.vim'
          Plugin 'junegunn/vim-emoji'
          Plugin 'altercation/vim-colors-solarized'
          Plugin 'ajmwagar/vim-deus'
        " Plugin 'morhetz/gruvbox'
        " Plugin 'chriskempson/vim-tomorrow-theme'
      
      " Formats
          Plugin 'genoma/vim-less'
          Plugin 'JulesWang/css.vim'
          Plugin 'leafgarland/typescript-vim'
          Plugin 'godlygeek/tabular'
          Plugin 'plasticboy/vim-markdown'
          
      " Additional
          Plugin 'kien/ctrlp.vim'
          Plugin 'tpope/vim-surround'
          Plugin 'tpope/vim-dispatch'
          Plugin 'tpope/vim-unimpaired'
        " Plugin 'tpope/vim-afterimage'
        " Plugin 'wavded/vim-stylus'
        " Plugin 'jplaut/vim-arduino-ino'
      
        call vundle#end()
      
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " BASIC SETTINGS
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      
        filetype plugin indent on
      
        set cmdheight=1
      
      " Highlight searches
        set hlsearch
      
      " Don't need compatibility with Vi
        set nocompatible
      
      " Switch between buffers without saving
        set hidden
      
      " Display current cursor position in the lower right corner
        set ruler
      
      " Search for tags up folders back to my home directory
        set tags=./tags,tags;$HOME
      
      " Enable syntax highlighting
        syntax on
      
      " Stop searching through node-module folders with CommandT
        set wildignore+=*/node_modules/*
        set wildignore+=*.pyc
        set wildignore+=*.swp,*.meta
      
      " No need for backup or swap files
        set nobackup
        set noswapfile
      
      " Write the old file out when switching between files
        " set autowrite
      
      " Lower lag after typing <Leader>
        set timeout timeoutlen=1000 ttimeoutlen=100
      
      " Tab stuff
        set tabstop=2
        set shiftwidth=2
        set softtabstop=2
        set autoindent
        set smartindent
      
      " convert tab to spaces
        set expandtab
        set smarttab
      
      " Show command in bottom right portion of screen
        set showcmd
      
      " Show line numbers
        set number
      
      " Always show the status line
        set laststatus=2
      
      " Prefer a slightly higher lineheigt
        set linespace=2
      
      " Better line wrapping
        set wrapmargin=79
        set textwidth=79
      
      " Word-wrap stuff
        set wrap
        set linebreak
        set formatoptions=qrn1
      
      " Set incremental searching
        set incsearch
      
      " case insensitive search
        set ignorecase smartcase
      
      " list disables linebreak
        set nolist
      
      " keep old textwidth settings
        set formatoptions+=l
        set mousehide
      
      " Completions for help
        set wildmenu
      
      " Session settings
        set sessionoptions=resize,winpos,winsize,buffers,tabpages,curdir,help
        set backspace=indent,eol,start
      
      " Spell checker only autoset for text files
        au! BufRead,BufNewFile * set nospell
        au! BufRead,BufNewFile markdown,text set spell
      
      " Open the current markdown file in the background on each write to update the preview
      
        " let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
      
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " Asynchronous Lint Engine
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

        let b:ale_linters = ['eslint']

				function! LinterStatus() abort
				    let l:counts = ale#statusline#Count(bufnr(''))
				
				    let l:all_errors = l:counts.error + l:counts.style_error
				    let l:all_non_errors = l:counts.total - l:all_errors
				
				    return l:counts.total == 0 ? 'OK' : printf(
				    \   '%dW %dE',
				    \   all_non_errors,
				    \   all_errors
				    \)
				endfunction


      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " Sytastic and OmniSharp functionality
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " set splitbelow
      
      " packload

      " let g:syntastic_javascript_checkers = ['eslint']
      " let g:syntastic_typescript_checkers = ['tslint']
      " let g:syntastic_always_populate_loc_list = 1
      " let g:syntastic_auto_loc_list = 1
      " let g:syntastic_check_on_open = 1
      " let g:syntastic_check_on_wq = 0

      " au! InsertLeave * :SyntasticCheck<CR>
      
      " nmap <leader>l :SyntasticToggleMode<CR>
      
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " CtrlP Options
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      
        let g:ctrlp_working_path_mode = 'a'
        let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:30'
      
        let g:ctrlp_prompt_mappings = {
          \ 'PrtSelectMove("j")':   ['<c-J>', '<down>'],
          \ 'PrtSelectMove("k")':   ['<c-K>', '<up>'],
          \ }
      
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " WINDOW FLOW
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      
        set winheight=25
        set winminheight=3
        set winwidth=90
        set winminwidth=20
        set nowrap
      
      " keep more context when scrolling off the end of a buffer
        set scrolloff=12
      
      " Turn off folding
        set foldmethod=manual
        set nofoldenable
      
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " STATUS LINE
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

      " Joe - minimal
      " set statusline=\ \ \ %<%.99f\ \ (%{&ft})\ %-4(%m%)%=%#warningmsg#%{''}%*%-19(%4l,%02c%03V%)
      "   \SyntasticStatuslineFlag()
      "   \}%*%-19(%4l,%02c%03V%)

      " Gary (Syntastic)
        set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%#warningmsg#%{
          \SyntasticStatuslineFlag()
          \}%*%-19(%4l,%02c%03V%)

      " Gary (ALE)
        set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%#warningmsg#%{
          \LinterStatus()
          \}%*%-19(%4l,%02c%03V%)
     

      " TPope
      " set statusline=%<%.99f\ %h%w%m%r%{
      "   \exists('*CapsLockStatusline')?CapsLockStatusline():''
      "   \}%y%=%-16(\ %l,%c-%v\ %)%P
      
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " KEY MAPPINGS
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      
      " Move arround splits with <c-[hjkl]>
        nnoremap <c-j> <c-w>j<c-w>_
        nnoremap <c-k> <c-w>k<c-w>_
        nnoremap <c-h> <c-w>h<c-w>_
        nnoremap <c-l> <c-w>l<c-w>_
      
      " Change leader
        let mapleader=' '
        nmap , <Nop>
      
      " Easier Mode escaping
        nmap <c-c> <esc>
      
      " Disable backspace
        inoremap <BS> <Nop>
      
      " Semicolon as colon to enter command mode
        nmap ; :
      
      " Save All, Save Current, and Close with <leader>
        nnoremap <leader>a :wa<cr>
        nnoremap <leader>w :w<cr>
        nnoremap <leader>q :q<cr>

      " Copy to system clipboards
        " CLIPBOARD
        noremap <leader>Y "+y
        " PRIMARY
        noremap <leader>y "*y

        " yank to clipboard
        if has("clipboard")
          set clipboard=unnamed " copy to the system clipboard

          if has("unnamedplus") " X11 support
            set clipboard+=unnamedplus
          endif
        endif
      
      " Switch to previous buffer in this window
        nnoremap <leader><leader> <c-^><c-w>_
      
        map <leader>sp :set paste<cr>
        map <leader>np :set nopaste<cr>
      
      " Open files in directory of current file
        cnoremap %% <C-R>=expand('%:h').'/'<cr>
        map <leader>e :edit %%
        map <leader>v :view %%
      
      " Put development/mac path in command line
        nmap <leader>dm :sp ~/Development/Mac/
        cmap <leader>dm ~/Development/Mac/
      
      " Easy clearing of search
        nmap <silent> <leader>/ :nohlsearch<CR>
        nmap <silent> <esc> :nohlsearch<CR>
      
      " Apply vimrc changes
        nmap <silent> <leader>sv :so $MYVIMRC<CR>
      
      " Apply vimrc changes
        nmap <silent> <leader>ev :sp $MYVIMRC<CR><c-w>K<c-w>_
      
      " New line no insert
        nmap <silent> , i<CR><C-c>l
      
      " Open current file with Mac open command
        nmap <silent> <leader>o :execute '!open "%"'<CR><CR>
      
      " Start find and replace entry
        nmap <leader>fr :%s/
      
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " YANK TO REGISTER K AND ATTEMPT TO OPEN AS NEW BUFFER IN A SPLIT PANE
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      
        if !exists("CleanKBadWhiteSpace")
          fu! CleanKBadWhiteSpace()
            let @k = substitute(@k, "\[\t\r\n]", "", "g")
          endf
        endif
      
        vmap <leader>z "ky :call CleanKBadWhiteSpace()<cr> <bar> :sp <c-r>k<cr>
        nmap <leader>z "kyy :call CleanKBadWhiteSpace()<cr> <bar> :sp <c-r>k<cr>
      
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " COLORS
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      
        set t_Co=256
      
      " range: dark 233-239, light 252-256
        if !exists("g:colorsloaded")
          let g:colorsloaded = 1
          " set background=light
          " colorscheme Tomorrow-Night
      
          let g:seoul256_background = 235
          colorscheme seoul256
      
          function! SetLight(light)
            let g:seoul256_background = a:light
            colorscheme seoul256
          endfunction
        endif
      
        nnoremap <leader>` :call SetLight(233)<cr>
        nnoremap <leader>1 :call SetLight(234)<cr>
        nnoremap <leader>2 :call SetLight(235)<cr>
        nnoremap <leader>3 :call SetLight(236)<cr>
        nnoremap <leader>4 :colorscheme deus<cr>
        nnoremap <leader>5 :call SetLight(238)<cr>
        nnoremap <leader>6 :call SetLight(252)<cr>
        nnoremap <leader>7 :call SetLight(253)<cr>
        nnoremap <leader>8 :call SetLight(254)<cr>
        nnoremap <leader>9 :call SetLight(255)<cr>
        nnoremap <leader>0 :call SetLight(256)<cr>
      
        " highlight Error ctermbg=239 ctermfg=167
        " highlight SpellBad ctermfg=250 ctermbg=239
      
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " JOURNAL
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      
        fu! Journal()
          let g:journalFileName = execute '\ '+
          !cd ~/journal; git fetch && git pull; echo "~/journal/`date +%F.md`"'
          execute "sp" g:journalFileName
        endfu
      
      
        nmap <leader>j :call Journal()<cr>


