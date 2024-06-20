-- LAZY.NVIM  
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




-- REMAPS  
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- PLUGINS

require("lazy").setup({
	{'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "folke/tokyonight.nvim"},
	{'nvim-treesitter/nvim-treesitter'},
	{ "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" },
}
})


-- TELESCOPE CONFIG
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files,{})
 -- vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ts', function() builtin.grep_string({ search = vim.fn.input("Grep >> ")}) end ) 


-- THEMES

THEME = "tokyonight"
require("rose-pine").setup({
	variant = "moon",
	extend_background_behind_borders = true,

	enable = {
		terminal = true,
		legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
		migrations = true, -- Handle deprecated options automatically
	},

	styles = {
		bold = true,
		italic = true,
		transparency = false,
	},
})


require("tokyonight").setup({
	style = "storm", 
        
})

vim.cmd("colorscheme " .. THEME) 


require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "javascript", "lua", "python", "php", "cpp" },
	highlight = { enable = true }
})


-- HARPOON CONFIG 
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-d>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<C-q>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-w>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-e>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-r>", function() harpoon:list():select(4) end)


