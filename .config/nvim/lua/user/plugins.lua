-- Get code from: https://github.com/LunarVim/Neovim-from-scratch/blob/03-plugins/lua/user/plugins.lua
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
    -- My plugins here
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
    -- NvimTree
    use("kyazdani42/nvim-web-devicons")
    use("kyazdani42/nvim-tree.lua")
    -- Bufferline
    use("akinsho/bufferline.nvim")
    use("moll/vim-bbye")
    -- Status line
    use("nvim-lualine/lualine.nvim")
    -- Theme
    -- Ayu theme
    use("ayu-theme/ayu-vim")
    -- Autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    -- Snippets
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")
    -- Lsp
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-media-files.nvim")
    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use("p00f/nvim-ts-rainbow")
    use("nvim-treesitter/playground")
    use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
    -- Comment
    use("numToStr/Comment.nvim") -- Easily comment stuff
    use("JoosepAlviste/nvim-ts-context-commentstring")
    -- Git
    use("lewis6991/gitsigns.nvim")
    -- Indent
    use("lukas-reineke/indent-blankline.nvim")
    -- Term
    use("akinsho/toggleterm.nvim")
    -- Dashboard
    use("goolord/alpha-nvim")
    use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
    -- Projects
    use("ahmedkhalf/project.nvim")
    -- Whichkeys
    use("folke/which-key.nvim")
    -- Color
    use("NvChad/nvim-colorizer.lua")
    -- Copilot
    use("zbirenbaum/copilot.lua")
    --[[ use("github/copilot.vim") ]]
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
