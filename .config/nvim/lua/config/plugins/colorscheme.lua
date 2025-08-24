return {
	-- Rose Pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "main",
				dark_variant = "main",
				dim_inactive_windows = false,
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
				highlight_groups = {
					ColorColumn = { bg = "#1C1C21" },
					Normal = { bg = "none" },
					Pmenu = { bg = "", fg = "#e0def4" },
					PmenuSel = { bg = "#4a465d", fg = "#f8f5f2" },
					PmenuSbar = { bg = "#191724" },
					PmenuThumb = { bg = "#9ccfd8" },
				},
				enable = {
					terminal = false,
					legacy_highlights = false,
					migrations = true,
				},
			})
		end,
	},

	-- Gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				transparent_mode = true,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
				},
				overrides = {
					Pmenu = { bg = "" },
				},
			})
		end,
	},

	-- Kanagawa
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				transparent = true,
				dimInactive = false,
				terminalColors = true,
				theme = "wave",
				background = { dark = "wave" },
				overrides = function(colors)
					local theme = colors.theme
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						Pmenu = { bg = "none", fg = theme.ui.shade0, blend = vim.o.pumblend },
						PmenuSel = { bg = theme.ui.bg_p2 },
					}
				end,
			})
		end,
	},

	-- Solarized Osaka
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		config = function()
			require("solarized-osaka").setup({
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = false },
					sidebars = "dark",
					floats = "dark",
				},
				on_highlights = function(hl, c)
					hl.TelescopePromptTitle = { bg = "#2d3149", fg = "#2C94DD" }
				end,
			})
		end,
	},

	-- Tokyonight
	{
		"folke/tokyonight.nvim",
		name = "folkeTokyonight",
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = "transparent",
					floats = "transparent",
				},
			})
		end,
	},

	-- Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					telescope = true,
					mini = true,
				},
			})
		end,
	},

	-- Poimandres
	{
		"olivercederborg/poimandres.nvim",
		name = "poimandres",
		lazy = false,
		priority = 1000,
		config = function()
			require("poimandres").setup({
				bold_vert_split = false,
				dim_nc_background = true,
				disable_background = true,
				disable_float_background = true,
				disable_italics = false,
			})
		end,
	},

	-- Nord
	{
		"shaunsingh/nord.nvim",
		name = "nord",
		config = function()
			vim.g.nord_contrast = true
			vim.g.nord_borders = false
			vim.g.nord_disable_background = true
			vim.g.nord_italic = true
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_bold = true
			require("nord").set()
		end,
	},
}
