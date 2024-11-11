local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("custom")
require("locals")
require("config.globals")
require("config.options")
require("config.keymaps")
require("config.autocmds")

local custom = require("custom")
local locals = require("locals")

local opts = {
    defaults = {
        lazy = true,
    },
    rtp = {
        disabled_plugins = {
            "gzip",
            "matchit",
            "matchparen",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
        },
    },
    change_detection = {
        notify = true,
    },
    spec = "plugins",
    dev = {
        path = "~/neovim/dev",
        patterns = locals.under_development,
        fallback = true,
    },
    install = {
        colorscheme = { "default" },
    },
    ui = {
        border = custom.border,
    },
    diff = {
        cmd = "diffview.nvim",
    },
}

require("lazy").setup("plugins", opts)
