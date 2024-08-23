--return {
--  {
--    "williamboman/mason.nvim",
--    config = function()
--      require("mason").setup()
--    end
--  },
--  {
--    'williamboman/mason-lspconfig.nvim',
--    config = function()
--      require("mason-lspconfig").setup({
--        ensure_installed = { "lua_ls", "tsserver" }
--      })
--    end
--  },
--  {
--    "neovim/nvim-lspconfig",
--    config = function()
--      local lspconfig = require("lspconfig")
--      lspconfig.lua_ls.setup({})
--      lspconfig.tsserver.setup({})
--
--      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
--      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
--      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
--    end
--  }
--}
--

return {
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"stevearc/conform.nvim",
			"b0o/SchemaStore.nvim",
		},

		config = function()
			require("config.lsp").setup()
		end,
	},
}
