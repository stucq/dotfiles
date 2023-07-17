-- installs and automatically configures packer if this hasn't yet been done

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])

		return true
	end

	return false
end

local packer_bootstrap = ensure_packer()

-- packages loaded by packer

require("packer").startup(function(use)
	-- packer itself
	use("wbthomason/packer.nvim")

	-- BEGIN LSP --

	-- plenary
	use("nvim-lua/plenary.nvim")

	-- mason, lsp manager
	use({
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		run = ":MasonUpdate",
	})

	-- bridge mason and lspconfig
	use({
		"jose-elias-alvarez/null-ls.nvim",
		"jay-babu/mason-null-ls.nvim",
	})

	-- improves lsp experience
	use({
		"glepnir/lspsaga.nvim",

		config = function()
			require("lspsaga").setup({
				enter = {
					enable_mapping = false,
				},
			})
		end,

		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- END LSP --
	-- BEGIN AUTOCOMPLETE --

	-- code autocompletion
	use({
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
	})

	-- snippet engine
	use({
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	})

	-- smart auto-pairing
	use({
		"ZhiyuanLck/smart-pairs",
		event = "InsertEnter",
		config = function()
			require("pairs"):setup({})
		end,
	})

	-- adds icons to autocompletion buffer
	use("onsails/lspkind.nvim")

	-- END AUTOCOMPLETE --
	-- BEGIN SYNTAX --

	-- syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-textobjects",
		run = ":TSUpdate",
	})

	-- code context
	use("nvim-treesitter/nvim-treesitter-context")

	-- color highlighter
	use("chrisbra/Colorizer")

	-- comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- END SYNTAX --
	-- BEGIN FILESYSTEM --

	-- git integration
	use("tpope/vim-fugitive")

	-- git decorations
	use("lewis6991/gitsigns.nvim")

	-- file tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = "nvim-web-devicons",
	})

	-- END FILESYSTEM --
	-- BEGIN AESTHETICS --

	-- actually decent tabs
	use("romgrk/barbar.nvim")

	-- theme
	use("EdenEast/nightfox.nvim")

	-- thinner color column
	use({
		"lukas-reineke/virt-column.nvim",
		config = function()
			require("virt-column").setup({})
		end,
	})

	-- indent highlighting
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				show_current_context = true,
				show_current_context_start = false,
			})
		end,
	})

	-- underlines cursor words and lines
	use({
		"yamatsum/nvim-cursorline",
		config = function()
			require("nvim-cursorline").setup({})
		end,
	})

	-- buffer which displays possible keymap completions
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	})

	-- smarter code folding
	use({
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
	})

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- nonicons
	use({
		"yamatsum/nvim-nonicons",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- notifications
	use("rcarriga/nvim-notify")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- in editor markdown preview
	use({
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup()
		end,
	})

	-- END AESTHETICS --

	-- START MISC --

	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- file tree
	use("preservim/nerdtree")

	-- discord rpc
	use("andweeb/presence.nvim")

	-- END MISC --

	-- automatically configure packer after cloning it
	if packer_bootstrap then
		require("packer").sync()
	end
end)

-- installs packages every time this file is modified

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost packer.lua source <afile> | PackerInstall
	augroup end
]])
