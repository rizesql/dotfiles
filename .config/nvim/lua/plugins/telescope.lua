return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", builde = "make" }
  },
  config = function()
    require("telescope").setup {
      extensions = {
        fzf = {}
      }
    }
    require("telescope").load_extension("fzf")

    vim.keymap.set("n", "<C-f>", require("telescope.builtin").find_files, { noremap = true, silent = true })
    vim.keymap.set("n", "<C-f><C-h>", require("telescope.builtin").help_tags, { noremap = true, silent = true })
  end
}
