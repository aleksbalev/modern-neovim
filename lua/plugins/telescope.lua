return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	keys = {
		{ "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
		{ "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
	},
	config = true,
}
