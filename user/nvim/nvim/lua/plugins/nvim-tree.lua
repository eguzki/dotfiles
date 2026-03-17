return {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({})
		end,
		dependencies = {
			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
	},
}
