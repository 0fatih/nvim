local custom = require("custom")

return {
	"stevearc/overseer.nvim",
	opts = function()
		return {
			dap = false,
			form = {
				border = custom.border,
			},
			confirm = {
				border = custom.border,
			},
			task_win = {
				border = custom.border,
			},
			component_aliases = {
				default = {
					{ "display_duration", detail_level = 2 },
					"on_output_summarize",
					"on_exit_set_status",
					"on_complete_notify",
					"on_complete_dispose",
					"unique",
				},
			},
		}
	end,
	config = function(_, opts)
		local overseer = require("overseer")

		overseer.setup(opts)

		do -- For lazy loading lualine component
			local success, lualine = pcall(require, "lualine")
			if not success then
				return
			end
			local lualine_cfg = lualine.get_config()
			for i, item in ipairs(lualine_cfg.sections.lualine_x) do
				if type(item) == "table" and item.name == "overseer-placeholder" then
					lualine_cfg.sections.lualine_x[i] = "overseer"
				end
			end
			lualine.setup(lualine_cfg)
		end

		local templates = {
			{
				name = "C++ build single file",
				builder = function()
					return {
						cmd = { "c++" },
						args = {
							"-g",
							vim.fn.expand("%:p"),
							"-o",
							vim.fn.expand("%:p:t:r"),
						},
					}
				end,
				condition = {
					filetype = { "cpp" },
				},
			},
			{
				name = "zig build",
				builder = function()
					return {
						cmd = { "zig" },
						args = {
							"build",
						},
					}
				end,
				condition = {
					filetype = { "zig" },
				},
			},
		}
		for _, template in ipairs(templates) do
			overseer.register_template(template)
		end
	end,
	keys = {
		{ "<leader>rr", "<cmd>OverseerRun<CR>", desc = "Run" },
		{ "<leader>rl", "<cmd>OverseerToggle<CR>", desc = "List" },
		{ "<leader>rn", "<cmd>OverseerBuild<CR>", desc = "New" },
		{ "<leader>ra", "<cmd>OverseerTaskAction<CR>", desc = "Action" },
		{ "<leader>ri", "<cmd>OverseerInfo<CR>", desc = "Info" },
		{ "<leader>rc", "<cmd>OverseerClearCache<CR>", desc = "Clear cache" },
	},
}
