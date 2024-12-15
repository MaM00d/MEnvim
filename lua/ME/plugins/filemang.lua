---@type LazySpec
---@type LazySpec
---@type LazySpec
---@type LazySpec
---@type LazySpec
return
---@type LazySpec
{
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
		-- 👇 in this section, choose your own keymappings!
		{
			"<leader>f",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			-- Open in the current working directory
			"<leader>ef",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			-- NOTE: this requires a version of yazi that includes
			-- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
			"<c-up>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	---@type YaziConfig
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},
		floating_window_scaling_factor = 1,
		yazi_floating_window_border = "none",
	},
}
-- return {
-- 	"ptzz/lf.vim",
-- 	dependencies = { "voldikss/vim-floaterm" },
-- 	config = function()
-- 		vim.g.lf_width = 168
-- 		vim.g.lf_height = 50
-- 		vim.g.floaterm_borderchars = "       "
-- 		vim.keymap.set("n", "<leader>of", vim.cmd.Ex)
-- 		vim.keymap.set("n", "<leader>of", vim.cmd.Ex)
-- 	end,
-- }
-- return {
-- 	"lmburns/lf.nvim",
-- 	config = function()
-- 		local fn = vim.fn
--
-- 		-- Defaults
-- 		require("lf").setup({
-- 			default_action = "drop", -- default action when `Lf` opens a file
-- 			default_actions = { -- default action keybindings
-- 				["<C-t>"] = "tabedit",
-- 				["<C-x>"] = "split",
-- 				["<C-v>"] = "vsplit",
-- 				["<C-o>"] = "tab drop",
-- 			},
--
-- 			-- winblend = 20, -- psuedotransparency level
-- 			dir = "", -- directory where `lf` starts ('gwd' is git-working-directory, ""/nil is CWD)
-- 			direction = "float", -- window type: float horizontal vertical
-- 			border = "single", -- border kind: single double shadow curved
-- 			height = fn.float2nr(47), -- height of the *floating* window
-- 			width = fn.float2nr(200), -- width of the *floating* window
-- 			escape_quit = false, -- map escape to the quit command (so it doesn't go into a meta normal mode)
-- 			focus_on_open = true, -- focus the current file when opening Lf (experimental)
-- 			mappings = true, -- whether terminal buffer mapping is enabled
-- 			tmux = false, -- tmux statusline can be disabled on opening of Lf
-- 			default_file_manager = true, -- make lf default file manager
-- 			disable_netrw_warning = true, -- don't display a message when opening a directory with `default_file_manager` as true
-- 			-- highlights = { -- highlights passed to toggleterm
-- 			-- 	Normal = { link = "Normal" },
-- 			-- 	NormalFloat = { link = "Normal" },
-- 			-- 	FloatBorder = { guifg = "<VALUE>", guibg = "<VALUE>" },
-- 			-- },
--
-- 			-- Layout configurations
-- 			-- layout_mapping = "<M-u>", -- resize window with this key
-- 			-- views = { -- window dimensions to rotate through
-- 			-- 	{ width = 0.800, height = 0.800 },
-- 			-- 	{ width = 0.600, height = 0.600 },
-- 			-- 	{ width = 0.950, height = 0.950 },
-- 			-- 	{ width = 0.500, height = 0.500, col = 0, row = 0 },
-- 			-- 	{ width = 0.500, height = 0.500, col = 0, row = 0.5 },
-- 			-- 	{ width = 0.500, height = 0.500, col = 0.5, row = 0 },
-- 			-- 	{ width = 0.500, height = 0.500, col = 0.5, row = 0.5 },
-- 			-- },
-- 		})
--
-- 		-- Equivalent
-- 		-- vim.keymap.set("n", "<M-o>", "<Cmd>lua require('lf').start()<CR>", { noremap = true })
-- 		-- vim.keymap.set("n", "<M-o>", "<Cmd>Lf<CR>", { noremap = true })
-- 		vim.keymap.set("n", "<leader>of", vim.cmd.Ex)
-- 		vim.keymap.set({ "n", "v" }, "<leader>f", "<Cmd>Lf<CR>")
-- 	end,
-- }
--
