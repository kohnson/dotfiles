" VimRC

" General config
""""""""""""""""
set number			" Relative line numbering
set relativenumber
set linebreak			" Wrap line at word
let mapleader = ","		" Leader
set spell spelllang=en_ca	" Spellcheck language
set nospell			" Unset spellcheck by default
nnoremap ZW :w<CR>
"nnoremap <leader>r :!Rscript -e "rmarkdown::render('%')"<CR>
nnoremap <leader>c :noh<CR>

" Plugins
"""""""""
call plug#begin()
Plug 'Shougo/deoplete.nvim'		" Auto-completion
Plug 'tpope/vim-fugitive'		" Git
Plug 'itchyny/lightline.vim'		" Statusline
Plug 'SirVer/ultisnips'			" Snippets
call plug#end()

" Environment variables
"""""""""""""""""""""""
if has('win32')
	let g:python3_host_prog = 'C:\Users\Angelo\scoop\apps\python\current\python.exe'
elseif has('unix')
	let g:python3_host_prog = '/usr/bin/python3'
endif

" Plugin Configs
""""""""""""""""
" DeoPlete
""""""""""
let g:deoplete#enable_at_startup = 1
""""""""""
" Snippets
""""""""""
if has ('win32')
	let g:UltiSnipsSnippetDirectories = ["C:\\Users\\Angelo\\AppData\\Local\\nvim\\snips"]
elseif has ('unix')
	let g:UltiSnipsSnippetDirectories = ["/home/angelo/.config/nvim/snippets"]
endif
let g:UltiSnipsUsePythonVersion = 3
"""""""""""
" Lightline
"""""""""""
set noshowmode
let g:lightline = {
	\ 'colorscheme': 'one',
	\ 'component_function': {
		\ 'readonly': 'LightlineReadonly',
	\ },
\ }
" Function for removing RO on help pages
function! LightlineReadonly()
	return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction
