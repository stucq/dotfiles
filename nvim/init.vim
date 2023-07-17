" sets a few basic Vim settings and loads lua config if running in nvim

set mouse=a

set number
set ruler
set cursorline

set noshowmode
set completeopt="menu"
set pumheight=10
set showtabline=4

set list
set listchars=tab:··,trail:·

set hlsearch
set ignorecase
set smartcase

set smartindent
set tabstop=2
set noexpandtab
set shiftwidth=2

set textwidth=80
set nowrap

set splitbelow
set splitright

set timeout
set timeoutlen=750

set scrolloff=6
set sidescrolloff=6

set termguicolors
syntax on

if has('nvim')
	luafile ~/.config/nvim/lua/init.lua

	nnoremap <leader>ff <cmd>Telescope find_files<cr>
	nnoremap <leader>fg <cmd>Telescope live_grep<cr>
	nnoremap <leader>fb <cmd>Telescope buffers<cr>
	nnoremap <leader>fh <cmd>Telescope help_tags<cr>
 
	nnoremap <leader>n <cmd>NERDTreeFocus<CR>
	nnoremap <C-n> <cmd>NERDTree<CR>
	nnoremap <C-t> <cmd>NERDTreeToggle<CR>
	nnoremap <C-f> <cmd>NERDTreeFind<CR>

	colorscheme nightfox
endif
