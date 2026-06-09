return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- use latest release, remove to use latest commit
		picker = {
			name = "telescope.nvim",
		},
		---@module 'obsidian'
		---@type obsidian.config
		opts = {
			legacy_commands = false, -- this will be removed in 4.0.0
			-- render-markdown.nvim handles markdown UI; only one should be active
			ui = { enable = false },
			workspaces = {
				{
					name = "main",
					path = "~/obsidian/main",
				},
			},
		},
	},
}
