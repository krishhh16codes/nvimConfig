local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itself	
	use 'preservim/nerdtree' -- NerdTree
	use 'rafi/awesome-vim-colorschemes' -- Retro Scheme
	use 'ryanoasis/vim-devicons' -- Developer Icons
	use 'tc50cal/vim-terminal' -- Vim Terminal
	use 'preservim/tagbar' -- Tagbar for code navigation
	use 'terryma/vim-multiple-cursors' -- CTRL + N for multiple cursors
	use 'folke/tokyonight.nvim'
	use "lukas-reineke/indent-blankline.nvim"
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use 'hrsh7th/cmp-nvim-lsp'
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use("rafamadriz/friendly-snippets") -- useful snippetsuse 'folke/tokyonight.nvim' -- TokyoNight ColorScheme  
	use({
		"aurum77/live-server.nvim",
		run = function()
			require"live_server.util".install()
		end,
		cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	})

	use {
		'goolord/alpha-nvim',
		config = function ()
			require'alpha'.setup(require'alpha.themes.dashboard'.config)
		end
	}

	use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
	use {
		'nvim-lualine/lualine.nvim', --Status Bar for nvim
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use {
		'nvim-treesitter/nvim-treesitter', --Global Syntax Highlighting
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	use {
		'nvim-tree/nvim-tree.lua', --nvim folder manager
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
	}
	use {
		"williamboman/mason.nvim", --Lsp Manager
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
	use {
		"folke/which-key.nvim", --KeyMap Display
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			end
		}

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
