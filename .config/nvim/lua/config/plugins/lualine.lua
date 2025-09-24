return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local colors = {
			color0 = "#092236", -- deep blue (unused but kept)
			color1 = "#ff5874", -- replace mode accent
			color2 = "#c3ccdc", -- light fg
			color3 = "#1c1e26", -- dark bg (we won't use for glass)
			color6 = "#a1aab8", -- mid fg
			color7 = "#828697", -- dim fg
			color8 = "#ae81ff", -- visual accent
		}

		local glass = "none"
		local my_lualine_theme = {
			normal = {
				a = { fg = colors.color2, bg = glass, gui = "bold" },
				b = { fg = colors.color6, bg = glass },
				c = { fg = colors.color6, bg = glass },
			},
			insert = {
				a = { fg = colors.color2, bg = glass, gui = "bold" },
				b = { fg = colors.color6, bg = glass },
				c = { fg = colors.color6, bg = glass },
			},
			visual = {
				a = { fg = colors.color8, bg = glass, gui = "bold" },
				b = { fg = colors.color6, bg = glass },
				c = { fg = colors.color6, bg = glass },
			},
			replace = {
				a = { fg = colors.color1, bg = glass, gui = "bold" },
				b = { fg = colors.color6, bg = glass },
				c = { fg = colors.color6, bg = glass },
			},
			inactive = {
				a = { fg = colors.color7, bg = glass, gui = "bold" },
				b = { fg = colors.color7, bg = glass },
				c = { fg = colors.color7, bg = glass },
			},
		}

		local mode = {
			"mode",
			fmt = function(str)
				return " " .. str
			end,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			-- cond = hide_in_width,
		}

		local filename = {
			"filename",
			file_status = true,
			path = 0,
		}

		local branch = { "branch", icon = { "", color = { fg = "#A6D4DE" } }, "|" }

		lualine.setup({
			icons_enabled = true,
			options = {
				theme = my_lualine_theme,

				component_separators = { left = " ", right = " " },
				section_separators = { left = " ", right = " " },
				globalstatus = true,
				disabled_filetypes = { statusline = {}, winbar = {} },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { branch },
				lualine_c = { diff, filename },
				lualine_x = {
					{
						-- require("noice").api.statusline.mode.get,
						-- cond = require("noice").api.statusline.mode.has,
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					-- { "encoding",},
					-- { "fileformat" },
					{ "filetype" },
				},
			},
		})
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
		-- optional: faint window separators (looks nice on glassy wezterm)
		vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3a3a3a", bg = "NONE" })

		-- keep it transparent even after changing colorschemes
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3a3a3a", bg = "NONE" })
			end,
		})
	end,
}
