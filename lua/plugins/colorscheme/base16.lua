---@type LazyPluginSpec
return {
	"RRethy/nvim-base16",
	lazy = true,
	opts = {},
	config = function(_, opts)
		require("base16-colorscheme").with_config(opts)
	end,
}
