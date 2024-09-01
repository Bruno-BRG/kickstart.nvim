-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

--break long line at blank spaces
vim.opt.linebreak = true

-- wrap long ling into the next line
vim.opt.wrap = true

--indentation size
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

return {

  -- COLORSCHEME

  {
    'zootedb0t/citruszest.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd 'colorscheme citruszest'
    end,
  },

  -- gruvbox
  --[[{
    'npxbr/gruvbox.nvim',
    requires = { 'rktjmp/lush.nvim' },
    config = function()
      vim.cmd 'colorscheme gruvbox'
    end,
  },--]]

  -- Moonfly
  --[[{
    'bluz71/vim-moonfly-colors',
    name = 'moonfly',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd 'colorscheme moonfly'
    end,
  },--]]

  --[[ Github theme{
    'projekt0n/github-nvim-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup {}

      vim.cmd 'colorscheme github_dark_high_contrast'
    end,
  },--]]

  -- Snippets plugin
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',

    dependencies = { 'rafamadriz/friendly-snippets' },

    config = function()
      local ls = require 'luasnip'
      ls.filetype_extend('javascript', { 'jsdoc' })

      --- TODO: What is expand?
      vim.keymap.set({ 'i' }, '<C-s>e', function()
        ls.expand()
      end, { silent = true })

      vim.keymap.set({ 'i', 's' }, '<C-s>;', function()
        ls.jump(1)
      end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<C-s>,', function()
        ls.jump(-1)
      end, { silent = true })

      vim.keymap.set({ 'i', 's' }, '<C-E>', function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end,
  },

  --Github Copilot
  {
    'github/copilot.vim',
  },
}
