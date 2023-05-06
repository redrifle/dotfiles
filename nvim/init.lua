-- Settings --
vim.opt.relativenumber = true
vim.opt.number = true
-- vim.opt.cursorline = true
vim.opt.colorcolumn = '80'
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 7
--vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.undofile = true

-- Plugins --
require('packer_config')
require('treesitter_config')
require('autopairs_config')
require('nvim-tree_config')
require('lualine_config')
require('nvim-cmp_config')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
require'lspconfig'.clangd.setup {
  capabilities = capabilities,
}

-- Color scheme --
vim.cmd('colorscheme base16-default-dark')
