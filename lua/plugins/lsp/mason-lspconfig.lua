local opts = {
	ensure_installed = {
		"efm",
		"lua_ls",
		"solidity",
		"gopls",
	},
	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
