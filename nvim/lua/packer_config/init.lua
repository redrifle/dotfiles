-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager
    use {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate'
    }
    use 'windwp/nvim-autopairs'
    use {
	'nvim-lualine/lualine.nvim', -- Lualine
	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'neovim/nvim-lspconfig' -- LSP configurations
    use 'L3MON4D3/LuaSnip' -- Snippet engine
    use 'saadparwaiz1/cmp_luasnip' -- Luasnip cmp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'RRethy/nvim-base16'
end)
