" This sets some Vim configuration options and loads the Lua part of the
" configuration (lua/init.lua).

set showmode
set number
set ruler
set mouse=a

set smartindent
set tabstop=2
set noexpandtab
set shiftwidth=2
set textwidth=80

set list
set listchars=tab:··,trail:·

set termguicolors
syntax on
colorscheme robin

luafile ~/.config/nvim/lua/init.lua
