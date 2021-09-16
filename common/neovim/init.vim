" VimRC

" Relative line numbering
:set number
:set relativenumber

" Plugins
call plug#begin()
" LaTeX tools
Plug 'lervag/vimtex'
" LaTeX syntax checking
Plug 'neomake/neomake'
" Auto-completion
if has('nvim')
	Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
" Git
Plug 'tpope/vim-fugitive'
" Airline

Plug 'vim-airline/vim-airline'
call plug#end()

" DeoPlete config
let g:deoplete#enable_at_startup = 1
" Add LaTeX functionality
call deoplete#custom#var('omni', 'input_patterns', {
	\ 'tex': g:vimtex#re#deoplete
	\})

" VimTex config
" PDF preview
let g:vimtex_view_general_viewer = 'C:\Users\Angelo\AppData\Local\SumatraPDF\SumatraPDF.exe'
let g:vimtex_view_general_options
	\ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" Environment variables
if has('win32')
	let g:python3_host_prog = 'C:\Python39\python.exe'
elseif has('unix')
	let g:python3_host_prog = '/usr/bin/python3'
endif
