local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup({
    snippet = {
	expand = function(args)
	    require('luasnip').lsp_expand(args.body)
	end
    },
    window = {
	 completion = cmp.config.window.bordered(),
	-- documentation = cmp.config.window.bordered(),
    },

    sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	{ name = 'luasnip' },
	{ name = 'buffer' },
    }),

    mapping = cmp.mapping.preset.insert({
--	['<C-b>'] = cmp.mapping.scroll_docs(-4),
--	['<C-f>'] = cmp.mapping.scroll_docs(4),
--	['<C-Space>'] = cmp.mapping.complete(),
--	['<C-e>'] = cmp.mapping.abort(),
	['<CR>'] = cmp.mapping.confirm({ select = false }),
	["<Tab>"] = cmp.mapping(function(fallback)
	    if cmp.visible() then 
		cmp.select_next_item()
	    elseif luasnip.expand_or_jumpable() then 
		luasnip.expand_or_jump()
--	    elseif has_words_before() then 
--		cmp.complete()
	    else 
		fallback()
	    end 
	end, { "i", "s" }),

	["<S-Tab>"] = cmp.mapping(function(fallback)
	    if cmp.visible() then
		cmp.select_prev_item()
	    elseif luasnip.jumpable(-1) then
		luasnip.jump(-1)
	    else
		fallback()
	    end
	end, { "i", "s" }),
    }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
	{ name = 'cmp_git' },
	{ name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
	{ name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
	{ name = 'path' },
	{ name = 'cmdline' },
    })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['clangd'].setup {
    capabilities = capabilities
}
