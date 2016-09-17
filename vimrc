""" GENERAL SETTINGS
set encoding=utf-8
set fileencoding=utf-8
set nocompatible
set noshowmode
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set nobackup                   " don't keep a backup file
set history=50                 " keep 50 lines of command line history
set ruler                      " show the cursor position all the time
set showcmd                    " display incomplete commands
set incsearch                  " do incremental searching
set number                     " line numbers
set mouse=a                    " use mouse in xterm to scroll
set scrolloff=5                " 5 lines before and after the current line when scrolling
set ignorecase                 " ignore case
set smartcase                  " but don't ignore it, when search string contains uppercase letters
set hid                        " allow switching buffers, which have unsaved changes
set nowrap                     " don't wrap by default
set cursorline                 " show a cursorline
set updatecount=200            " this many chars befor updating .swapfile
set confirm
let &guicursor=&guicursor . ",a:blinkon0"

" spell
set spellfile=$HOME/.vim/spell/spell.add

runtime bundle/pathogen.vim.git/autoload/pathogen.vim
call pathogen#infect()

""" COLOR/STYLE RELATED
set t_Co=256
colorscheme lucius
set background=dark
set listchars=tab:»·,trail:·,eol:¬

""" CODE/HACKING
"set expandtab    " insert space characters whenever the tab key is presse
set tabstop=3    " insert 3 spaces characters when tab key is pressed
set shiftwidth=3 " insert 3 spaces when autoindent indents
set autoindent   " automatically indent files
set smartindent  " do smart indentation depending on code syntax
set showmatch    " showmatch: Show the matching bracket for the last ')'?
set cindent
filetype plugin indent on
syntax on
set foldmethod=syntax
set grepprg=git\ grep\ --no-color\ -n\ $*

:hi ColorColumn ctermbg=darkgrey
" set cc=+1
" call matchadd('ColorColumn', '\%81v', 100)
nnoremap <silent> <Leader>ll
      \ :if exists('w:long_line_match') <Bar>
      \   silent! call matchdelete(w:long_line_match) <Bar>
      \   unlet w:long_line_match <Bar>
      \ elseif &textwidth > 0 <Bar>
      \   let w:long_line_match = matchadd('ColorColumn', '\%>'.&tw.'v.\+', -1) <Bar>
      \ else <Bar>
      \   let w:long_line_match = matchadd('ColorColumn', '\%>80v.\+', -1) <Bar>
      \ endif<CR>


""" PLUGIN SETTINGS
" rainbowparentheses
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
map <leader>rp :RainbowParenthesesToggle<CR>

" indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" youcompleteme
let g:ycm_filetype_whitelist = {'c': 1, 'python': 1}
let g:ycm_confirm_extra_conf = 0

" nerdtree
map <leader>nt :NERDTreeToggle<CR>

" white space
highlight ExtraWhitespace ctermbg=red
map <leader>ws :ToggleWhitespace<CR>

" man pages
source $VIMRUNTIME/ftplugin/man.vim
nnoremap K :Man <C-R><C-W><CR>

" dragvisuals
vmap <expr> <LEFT> DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <DOWN> DVB_Drag('down')
vmap <expr> <UP> DVB_Drag('up')
vmap <expr> D DVB_Duplicate()

" vim latex-suite
let g:tex_flavor='latex'
set winaltkeys=no " prevent ALT-mappings jumping to menu-bar
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_ViewRule_pdf = 'evince'

" lightline
set laststatus=2
let g:lightline = {
	\ 'colorscheme' : 'Tomorrow_Night',
	\ }

" tmuxline
let g:tmuxline_theme = 'zenburn'
let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
	\ 'left': '',
	\ 'left_alt': '>',
	\ 'right': '',
	\ 'right_alt': '<',
	\ 'space': ' '}

" git gutter
let g:gitgutter_enabled = 0
map <leader>gg :GitGutterToggle<CR>

" tagbar
map <leader>tb :TagbarToggle<CR>
let g:tagbar_iconchars = ['▸', '▾']

" syntastic
"let g:syntastic_python_checkers = ['flake8', 'pyflakes', 'pylint']
let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_flake8_args = '--ignore=E501'
let g:syntastic_python_flake8_args = '--max-line-length=110'

" delimitmate
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" python
let python_highlight_all = 1

" ultisnip
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

" easymotion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_use_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:calendar_first_day = "monday"
let g:calendar_date_endian = "little"
let g:calendar_time_zone = "+0200"
let g:calendar_date_separator = "."
let g:calendar_frame = "unicode"

" vim-go
let g:go_fmt_command = "goimports"


""" MAPPINGS
" map Y y']
inoremap jj			<Esc>
"inoremap zz		<Esc>%%a<space>
inoremap zz			<Esc>%%a
" <esc> maps to Alt-key, whatever
nnoremap <esc>k	:cp<CR>
nnoremap <esc>j	:cn<CR>
nnoremap <esc>o	:copen<CR>
nnoremap <esc>c	:cclose<CR>
inoremap <C-v>		<C-r>=system("xclip -o")<CR>

iab teh the
iab Teh The

