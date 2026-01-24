return {
  -- UI melhorada
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = {},
  },

  -- Tema OneDark (VS Code style)
  {
    'olimorris/onedarkpro.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('onedarkpro').setup {
        options = {
          cursorline = true,
          transparency = false,
          terminal_colors = true,
        },
        colors = {
          dark = {
            bg = '#1e1e1e',
            fg = '#d4d4d4',
          }
        },
        highlights = {
          ['@function'] = { fg = '#DCDCAA' },
          ['@function.call'] = { fg = '#DCDCAA' },
          ['@method'] = { fg = '#DCDCAA' },
          ['@lsp.type.method'] = { fg = '#DCDCAA' },
          ['@lsp.type.function'] = { fg = '#DCDCAA' },
          Function = { fg = '#DCDCAA' },
          
          ['@variable'] = { fg = '#9CDCFE' },
          ['@variable.builtin'] = { fg = '#9CDCFE' },
          ['@parameter'] = { fg = '#9CDCFE' },
          Identifier = { fg = '#9CDCFE' },
          ['@lsp.type.variable'] = { fg = '#9CDCFE' },
          ['@lsp.type.property'] = { fg = '#9CDCFE' },
          
          ['@constant'] = { fg = '#4FC1FF' },
          ['@constant.builtin'] = { fg = '#569cd6' },
          Constant = { fg = '#4FC1FF' },
          
          ['@type'] = { fg = '#4EC9B0' },
          ['@type.builtin'] = { fg = '#4EC9B0' },
          Type = { fg = '#4EC9B0' },
          
          String = { fg = '#ce9178' },
          ['@string'] = { fg = '#ce9178' },
          Number = { fg = '#b5cea8' },
          ['@number'] = { fg = '#b5cea8' },
          
          Keyword = { fg = '#569cd6' },
          ['@keyword'] = { fg = '#569cd6' },
          ['@keyword.return'] = { fg = '#C586C0' },
          ['@keyword.operator'] = { fg = '#C586C0' },
          
          Operator = { fg = '#d4d4d4' },
          ['@operator'] = { fg = '#d4d4d4' },
          
          Comment = { fg = '#6A9955', italic = true },
          ['@comment'] = { fg = '#6A9955', italic = true },
        },
      }
      vim.cmd.colorscheme 'onedark'
    end,
  },

  -- Better escape
  {
    'max397574/better-escape.nvim',
    event = 'InsertEnter',
    opts = {},
  },
  
  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  
  -- Diagnostics list
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'Trouble',
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
    },
    opts = {},
  },
  
  -- Fast navigation
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
    },
    opts = {},
  },
  
  -- Smooth scrolling
  {
    'karb94/neoscroll.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  
  -- Highlight word under cursor
  {
    'RRethy/vim-illuminate',
    event = 'VeryLazy',
    config = function()
      require('illuminate').configure({
        delay = 200,
        under_cursor = true,
      })
    end,
  },
  
  -- TypeScript utilities
  {
    'pmizio/typescript-tools.nvim',
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
}
