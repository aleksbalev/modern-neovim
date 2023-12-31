return {
	{
		"mrjones2014/legendary.nvim",
		keys = {
			{ "<C-S-p>", "<cmd>Legendary<cr>", desc = "Legendary" },
			{ "<leader>hc", "<cmd>Legendary<cr>", desc = "Command Palette" },
		},
		opts = {
			which_key = { auto_register = true },
		},
	},
	{
		"folke/which-key.nvim",
		dependencies = {
			"mrjones2014/legendary.nvim",
		},
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.setup({
				show_help = true,
				plugins = { spelling = true },
				key_labels = { ["<leader>"] = "SPC" },
				triggers = "auto",
			})
			wk.register({
				mode = { "n", "v" },
				w = { "<cmd>update!<CR>", "Save" },
        -- stylua: ignore
        q = { name = "Quit", 
          q = { function() require("utils").quit() end, "Quit", },
          t = { "<cmd>tabclose<cr>", "Close Tab" },
        },
				S = { name = "Toggle Spectre" },
				b = { name = "+Buffer" },
				d = { name = "+Debug" },
				f = { name = "+File" },
				h = { name = "+Help" },
				g = { name = "+Git" },
				p = { name = "+Project" },
				t = { name = "+Test", N = { name = "Neotest" }, o = { "Overseer" } },
				v = { name = "+View" },
				z = { name = "+System" },
				c = {
					name = "+Code",
					g = { name = "Annotation" },
					x = {
						name = "Swap Next",
						f = "Function",
						p = "Parameter",
						c = "Class",
					},
					X = {
						name = "Swap Previous",
						f = "Function",
						p = "Parameter",
						c = "Class",
					},
				},
			}, { prefix = "<leader>" })
		end,
	},
}
