return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>t"] = { name = "+Test" },
        ["<leader>tt"] = { name = "+Task" },
      },
    },
  },
  {
    "vim-test/vim-test",
    opts = {
      setup = {},
    },
    config = function(plugin, opts)
      vim.g["test#strategy"] = "neovim"
      vim.g["test#neovim#term_position"] = "belowright"
      vim.g["test#neovim#preserve_screen"] = 1

      -- Set up vim-test
      for k, _ in pairs(opts.setup) do
        opts.setup[k](plugin, opts)
      end
    end,
  },
  {
    "stevearc/overseer.nvim",
    keys = {
      { "<leader>ttR", "<cmd>OverseerRunCmd<cr>", desc = "Run Command" },
      { "<leader>tta", "<cmd>OverseerTaskAction<cr>", desc = "Task Action" },
      { "<leader>ttb", "<cmd>OverseerBuild<cr>", desc = "Build" },
      { "<leader>ttc", "<cmd>OverseerClose<cr>", desc = "Close" },
      { "<leader>ttd", "<cmd>OverseerDeleteBundle<cr>", desc = "Delete Bundle" },
      { "<leader>ttl", "<cmd>OverseerLoadBundle<cr>", desc = "Load Bundle" },
      { "<leader>tto", "<cmd>OverseerOpen<cr>", desc = "Open" },
      { "<leader>ttq", "<cmd>OverseerQuickAction<cr>", desc = "Quick Action" },
      { "<leader>ttr", "<cmd>OverseerRun<cr>", desc = "Run" },
      { "<leader>tts", "<cmd>OverseerSaveBundle<cr>", desc = "Save Bundle" },
      { "<leader>ttt", "<cmd>OverseerToggle<cr>", desc = "Toggle" },
    },
    opts = {},
  },
  {
    "anuvyklack/hydra.nvim",
    opts = {
      specs = {
        test = function()
          local cmd = require("hydra.keymap-util").cmd
          local hint = [[
^
_f_: File
_F_: All Files
_l_: Last
_n_: Nearest
^
_d_: Debug File
_L_: Debug Last
_N_: Debug Nearest
^
_o_: Output
_S_: Summary
^
_a_: Attach
_s_: Stop
^
^ ^  _q_: Quit 
          ]]
          return {
            name = "Test",
            hint = hint,
            config = {
              color = "pink",
              invoke_on_body = true,
              hint = {
                border = "rounded",
                position = "top-left",
              },
            },
            mode = "n",
            body = "<A-t>",
            heads = {
              { "F", cmd "w|lua require('neotest').run.run(vim.loop.cwd())", desc = "All Files" },
              { "L", cmd "w|lua require('neotest').run.run_last({strategy = 'dap'})", desc = "Debug Last" },
              { "N", cmd "w|lua require('neotest').run.run({strategy = 'dap'})", desc = "Debug Nearest" },
              { "S", cmd "w|lua require('neotest').summary.toggle()", desc = "Summary" },
              { "a", cmd "w|lua require('neotest').run.attach()", desc = "Attach" },
              { "d", cmd "w|lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'}", desc = "Debug File" },
              { "f", cmd "w|lua require('neotest').run.run(vim.fn.expand('%'))", desc = "File" },
              { "l", cmd "w|lua require('neotest').run.run_last()", desc = "Last" },
              { "n", cmd "w|lua require('neotest').run.run()", desc = "Nearest" },
              { "o", cmd "w|lua require('neotest').output.open({ enter = true })", desc = "Output" },
              { "s", cmd "w|lua require('neotest').run.stop()", desc = "Stop" },
              { "q", nil, { exit = true, nowait = true, desc = "Exit" } },
            },
          }
        end,
      },
    },
  },
  {
    "echasnovski/mini.hipatterns",
    event = "BufReadPre",
    opts = function()
      local hi = require "mini.hipatterns"
      return {
        highlighters = {
          hex_color = hi.gen_highlighter.hex_color { priority = 2000 },
        },
      }
    end,
  },
}
