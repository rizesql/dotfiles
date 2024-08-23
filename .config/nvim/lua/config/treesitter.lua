local M = {}

M.setup = function()
	local config = require("nvim-treesitter.configs")
	config.setup({
		ensure_installed = { "lua", "javascript", "rust" },
		highlight = { enable = true },
		indenting = { enable = true },
	})
end

return M
