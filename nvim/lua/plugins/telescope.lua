local icons = require("nvim-nonicons")

require("telescope").setup({
	defaults = {
		prompt_prefix = "  " .. icons.get("telescope") .. "  ",
		selection_caret = " ❯ ",
		entry_prefix = "   ",
	},
})
