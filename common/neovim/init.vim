" VimRC

" Personal config
"""""""""""""""""
set number		" Relative line numbering
set relativenumber
set linebreak		" Wrap line at word
let mapleader = ","	" Leader

" Plugins
"""""""""
call plug#begin()
Plug 'lervag/vimtex'			" LaTeX tools
Plug 'neomake/neomake'			" LaTeX syntax checking
Plug 'Shougo/deoplete.nvim'		" Auto-completion
Plug 'tpope/vim-fugitive'		" Git
Plug 'itchyny/lightline.vim'		" Statusline
Plug 'sirver/ultisnips'			" Snippets
call plug#end()

" Environment variables
"""""""""""""""""""""""
if has('win32')
	let g:python3_host_prog = 'C:\Python39\python.exe'
elseif has('unix')
	let g:python3_host_prog = '/usr/bin/python3'
endif

" Plugin Configs
""""""""""""""""
" DeoPlete
""""""""""
let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('omni', 'input_patterns', {'tex': g:vimtex#re#deoplete})	" Add LaTeX functionality
""""""""
" VimTex
""""""""
if has ('win32')
	let g:vimtex_view_general_viewer = 'C:\Users\Angelo\AppData\Local\SumatraPDF\SumatraPDF.exe'
elseif has ('unix')
	let g:vimtex_view_general_viewer = 'zathura'
endif
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
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
	\ }
