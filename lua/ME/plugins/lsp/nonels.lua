return {

	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					css = { "prettier" },
					scss = { "prettier" },
					html = { "prettier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					-- Conform will run multiple formatters sequentially
					yaml = { "prettier" },
					markdown = { "prettier" },
					python = { "isort", "black" },
					graphql = { "prettier" },
					-- You can customize some of the format options for the filetype (:help conform.format)
					-- rust = { "leptosfmt" }, --"rustfmt", lsp_format = "fallback" },
					go = { "gofumpt" },
					sql = { "sqlfmt" },
					-- Conform will run the first available formatter
					javascript = { "prettierd", "prettier", stop_after_first = true },
				},
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
	{
		"zapling/mason-conform.nvim",
		config = function()
			require("mason-conform").setup({})
		end,
	},
	{
		-- formatting.prettier, -- js/ts formatter
		-- formatting.stylua, -- lua formatter
		-- formatting.isort,
		-- formatting.shfmt,
		-- formatting.black,
		-- formatting.dart_format,
		-- -- formatting.rustfmt,
		-- formatting.leptosfmt,
		-- formatting.clang_format,
		-- diagnostics.pylint,
		-- formatting.gofumpt,
		-- -- formatting.openscad,
		-- formatting.goimports_reviser,
		-- formatting.golines,
		-- formatting.sqlfmt,
		"mfussenegger/nvim-lint",
		opts = {},
		config = function()
			require("lint").linters_by_ft = {
				markdown = { "vale" },
				-- lua = { "luac" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					-- try_lint without arguments runs the linters defined in `linters_by_ft`
					-- for the current filetype
					require("lint").try_lint()

					-- You can call `try_lint` with a linter name or a list of names to always
					-- run specific linters, independent of the `linters_by_ft` configuration
					-- require("lint").try_lint("cspell")
				end,
			})
		end,
	},

	{
		"rshkarin/mason-nvim-lint",
		opts = {},
		config = function()
			require("mason-nvim-lint").setup({
				-- A list of linters to automatically install if they're not already installed. Example: { "eslint_d", "revive" }
				-- This setting has no relation with the `automatic_installation` setting.
				-- Names of linters should be taken from the mason's registry.
				---@type string[]
				ensure_installed = {},

				-- Whether linters that are set up (via nvim-lint) should be automatically installed if they're not already installed.
				-- It tries to find the specified linters in the mason's registry to proceed with installation.
				-- This setting has no relation with the `ensure_installed` setting.
				---@type boolean
				-- automatic_installation = true,

				-- Disables warning notifications about misconfigurations such as invalid linter entries and incorrect plugin load order.
				quiet_mode = false,
			})
		end,
	},
}
