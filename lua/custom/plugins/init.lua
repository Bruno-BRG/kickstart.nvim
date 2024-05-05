-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

--break long line at blank spaces
vim.opt.linebreak = true

-- wrap long ling into the next line
vim.opt.wrap = true

--indentation size
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

return {
  --snippets plugin
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
