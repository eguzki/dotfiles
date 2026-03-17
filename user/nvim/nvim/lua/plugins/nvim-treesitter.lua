return {
	{
		"nvim-treesitter/nvim-treesitter",
		-- Use stable version compatible with Neovim < 0.12
		branch = "master",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			-- local treesitter = require("nvim-treesitter.configs")
			local status, treesitter = pcall(require, "nvim-treesitter.configs")
			if not status then
				vim.notify("nvim-treesitter.configs not found. Run :Lazy sync", vim.log.levels.WARN)
				return
			end

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
				},
				-- enable indentation
				indent = { enable = true },
				-- ensure these language parsers are installed
				ensure_installed = {
					"bash",
					"go",
					"diff",
					"rust",
					"json",
					"javascript",
					"typescript",
					"tsx",
					"toml",
					"yaml",
					"html",
					"css",
					"markdown",
					"markdown_inline",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
}
