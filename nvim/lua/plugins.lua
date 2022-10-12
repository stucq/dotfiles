-- Plugins loaded with packer.nvim.

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' },
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'jiangmiao/auto-pairs'
	use 'numToStr/Comment.nvim'
	use 'feline-nvim/feline.nvim'
	use 'seandewar/killersheep.nvim'
	use 'ray-x/lsp_signature.nvim'
	use 'andweeb/presence.nvim'
	use 'mhinz/vim-startify'
end)

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerInstall
	augroup end
]])
