require("mason").setup()

require("mason-null-ls").setup({
	ensure_installed = {
		"cppcheck",
		"hadolint",
		"markdownlint",
		"markuplint",
		"pycodestyle",
		"selene",
		"shellcheck",
		"spectral",
		"stylelint",

		"beautysh",
		"black",
		"clang_format",
		"prettier",
		"prettierd",
		"sqlfluff",
		"stylua",
		"taplo",
		"xmllint",

		"codespell",
		"todo_comments",
	},

	automatic_installation = true,
	handlers = {},
})
