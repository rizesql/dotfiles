return {
  {
    "stevearc/oil.nvim",
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    config = function()
      local oil = require("oil")
      oil.setup({
        view_options = {
          show_hidden = true,
        },
      })
      vim.keymap.set("n", "-", oil.toggle_float, {})
    end
    --    config = function()
    -- vim.keymap.set("n", "-", "<cmd>Oil<CR>")
    --  end
  }
}
