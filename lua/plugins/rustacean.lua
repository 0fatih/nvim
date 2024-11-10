return {
	"mrcjkb/rustaceanvim",
	version = "^5", -- Recommended
	lazy = false, -- This plugin is already lazy

	opts = {
		dap = {
			adapter = {
				type = "server",
				port = "${port}",
				host = "127.0.0.1",
				executable = {
					command = "codelldb",
					args = {
						"--port",
						"${port}",
						"--settings",
						vim.json.encode({
							showDisassembly = "never",
						}),
					},
				},
			},
		},
	},
	config = function(_, opts)
		vim.g.rustaceanvim = opts
	end,
}
