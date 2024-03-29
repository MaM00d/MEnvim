return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({
			dev_log = {
				enabled = true,
				notify_errors = false, -- if there is an error whilst running then notify the user
				open_cmd = "tabedit", -- command to use to open the log buffer
			},
			widget_guides = {
				enabled = true,
			},
			debugger = {
				enabled = true,
				register_configurations = function(_)
					require("dap").configurations.dart = {}
					require("dap.ext.vscode").load_launchjs()
				end,
			},
			lsp = {
				color = { -- show the derived colours for dart variables
					enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
					background = true, -- highlight the background
					background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
					foreground = true, -- highlight the foreground
					virtual_text = true, -- show the highlight using virtual text
					virtual_text_str = "■", -- the virtual text character to highlight
				},
			},
		})
	end,
}, {
	"gcanoxl/dart-const-organizer.nvim",
	config = function()
		require("dart-const-organizer").setup()
	end,
}
