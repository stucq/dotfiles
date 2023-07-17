require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"awk",
		"bash",
		"c",
		"cpp",
		"css",
		"comment",
		"dockerfile",
		"gitcommit",
		"gitignore",
		"gitattributes",
		"git_config",
		"git_rebase",
		"html",
		"ini",
		"java",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"rasi",
		"regex",
		"rust",
		"scss",
		"sql",
		"toml",
		"vim",
		"vimdoc",
		"yaml",
		"yuck",
	},

	sync_install = false,
	auto_install = true,
	ignore_install = { "javascript" },

	highlight = {
		enable = true,

		disable = function(lang, buf)
			local max_filesize = 102400
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		additional_vim_regex_highlighting = false,
	},
})
