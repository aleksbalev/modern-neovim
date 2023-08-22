return {

  {
    "ThePrimeagen/harpoon",
    --stylua: ignore
    keys = {
      { "<leader>a",  function() require("harpoon.mark").add_file() end,            desc = "Add File" },
      { "<leader>jm", function() require("harpoon.ui").toggle_quick_menu() end,     desc = "File Menu" },
      { "<leader>jc", function() require("harpoon.cmd-ui").toggle_quick_menu() end, desc = "Command Menu" },
      { "<C-b>",      function() require("harpoon.ui").nav_file(1) end,             desc = "File 1" },
      { "<C-n>",      function() require("harpoon.ui").nav_file(2) end,             desc = "File 2" },
      { "<C-t>",      function() require("harpoon.ui").nav_file(3) end,             desc = "File 3" },
      { "<C-s>",      function() require("harpoon.ui").nav_file(4) end,             desc = "File 4" },
      { "<leader>1",  function() require("harpoon.term").gotoTerminal(1) end,       desc = "Terminal 1" },
      { "<leader>2",  function() require("harpoon.term").gotoTerminal(2) end,       desc = "Terminal 2" },
    },
    opts = {
      global_settings = {
        save_on_toggle = true,
        enter_on_sendcmd = true,
      },
    },
  },
}
