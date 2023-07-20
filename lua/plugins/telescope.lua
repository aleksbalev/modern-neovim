return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
    { "<leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ")});
    end, desc = "Grep" },
  },
  config = true,
}