return {

	"hiphish/rainbow-delimiters.nvim",
	config = function()
		-- This module contains a number of default definitions
		local rainbow_delimiters = require("rainbow-delimiters")

		vim.cmd("highlight babyblue guifg=#0F71F2")
		vim.cmd("highlight babypurple guifg=#AD03DE")
		vim.cmd("highlight babyred guifg=#C60009")
		vim.cmd("highlight babyyellow guifg=#06B48B")
		vim.cmd("highlight babygreen guifg=#0ADD08")

		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rainbow_delimiters.strategy["local"],
				vim = rainbow_delimiters.strategy["local"],
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
			priority = {
				[""] = 110,
				lua = 210,
			},
			highlight = {
				"babyyellow",
				"babygreen",
				"babyblue",
				"babypurple",
				"babyred",
			},
		}
	end,
}
