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
  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
  }
  vim.g.coq_settings = {
    auto_start = true,
  }

  use 'jiangmiao/auto-pairs'

  use 'rebelot/kanagawa.nvim'
  vim.cmd('colorscheme kanagawa')

  -- use 'rose-pine/neovim'
  -- vim.g.rose_pine_variant = 'main'
  -- vim.cmd('colorscheme rose-pine')

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  require('lualine').setup({
    options = {
      section_separators = '',
      component_separators = '',
      theme = 'kanagawa',
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

  use 'neovim/nvim-lspconfig'
  local nvim_lsp = require('lspconfig')
  local coq = require('coq')

  -- use 'ray-x/lsp_signature.nvim'
  -- require('lsp_signature').setup()

  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  use 'olical/conjure'

  use 'wlangstroth/vim-racket'
  nvim_lsp.racket_langserver.setup(
    coq.lsp_ensure_capabilities({
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    })
  )

  use 'janet-lang/janet.vim'

  use {
    'junegunn/fzf',
    run = './install --bin',
  }
  use 'junegunn/fzf.vim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-obsession'
  use 'tommcdo/vim-exchange'
  use 'inkarkat/vim-ReplaceWithRegister'
  use 'junegunn/vim-easy-align'
  vim.cmd [[
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
  ]]
  use 'ntpeters/vim-better-whitespace'
  vim.g.better_whitespace_enabled = 1
  vim.g.strip_whitespace_on_save = 1
  vim.g.strip_whitespace_confirm = 0
end)
