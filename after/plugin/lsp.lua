local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer',})
lsp.nvim_workspace()


lsp.on_attach(function(client,bufnr)
	local opts = {buffer = bufnr , remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)	
lsp.setup()
