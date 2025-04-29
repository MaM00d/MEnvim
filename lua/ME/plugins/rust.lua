return {
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
		ft = "rust",
		config = function()
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = "*.rs",
				callback = function()
					local found = vim.fn.search("view!", "nw")
					if found > 0 then
						local filepath = vim.fn.expand("%:p")
						vim.fn.system("leptosfmt " .. filepath)
						vim.cmd("edit!")
					end
				end,
			})
			local mason_registry = require("mason-registry")
			local codelldb = mason_registry.get_package("codelldb")
			local extension_path = codelldb:get_install_path() .. "/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
			-- If you are on Linux, replace the line above with the line below:
			-- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
			local cfg = require("rustaceanvim.config")

			vim.g.rustaceanvim = {
				-- Plugin configuration
				tools = {},
				-- LSP configuration
				server = {
					on_attach = function(client, bufnr)
						-- you can also put keymaps in here
					end,

					default_settings = {
						-- rust-analyzer language server configuration
						["rust-analyzer"] = {
							rustfmt = {
								overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
							},
							cargo = {
								allFeatures = true,
								features = "all", -- features = ssr, for LSP support in leptos SSR functions
								-- loadOutDirsFromCheck = true,
								runBuildScripts = true,
								extraEnv = {
									RUSTFLAGS = "--cfg rust_analyzer",
								},
							},
							-- Add clippy lints for Rust.
							checkOnSave = {
								allFeatures = true,
								command = "clippy",
								extraArgs = { "--no-deps" },
							},
							diagnostics = {
								disabled = {
									"inactive-code",
								},
								enable = false,
							},
							-- procMacro = {
							-- 	enable = true,
							-- 	ignored = {
							-- 		["async-trait"] = { "async_trait" },
							-- 		["napi-derive"] = { "napi" },
							-- 		["async-recursion"] = { "async_recursion" },
							-- 	},
							-- },
						},
					},
				},
				-- DAP configuration
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			}
		end,
	},

	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},

	{
		"saecki/crates.nvim",
		ft = { "toml" },
		config = function()
			require("crates").setup({
				completion = {
					cmp = {
						enabled = true,
					},
				},
			})
			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
		end,
	},
}
