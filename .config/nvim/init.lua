-- Load the "default" configuration file
vim.cmd('source ~/.vimrc')

-- Bootstrap packer.nvim
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
    augroup Packer
      autocmd!
      autocmd BufWritePost init.lua PackerCompile
    augroup end
  ]],
  false
)

-- Load plugins
-- TODO: move the plugins to their own files
local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'ms-jpq/coq_nvim'
  vim.g.coq_settings = {
    auto_start = true,
  }

  use 'jiangmiao/auto-pairs'

  use 'rose-pine/neovim'
  vim.g.rose_pine_variant = 'moon'
  vim.cmd('colorscheme rose-pine')

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  require('lualine').setup({
    options = {
      section_separators = '',
      component_separators = '',
      theme = 'rose-pine',
    },
    tabline = {
      lualine_a = {'buffers'},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {'filename'},
      lualine_z = {'tabs'},
    }
  })

  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tommcdo/vim-exchange'
  use 'inkarkat/vim-ReplaceWithRegister'
end)
