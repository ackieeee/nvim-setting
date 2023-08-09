require("packer").startup(function()
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  -- use 'williamboman/nvim-lsp-installer'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'cocopon/iceberg.vim'
  use 'obaland/vfiler.vim'
  use 'obaland/vfiler-fzf'
  -- use 'ibhagwan/fzf-lua'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  -- nvim-cmp
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/vim-vsnip"

  -- telescope-file-browser
  use "nvim-telescope/telescope-file-browser.nvim"

  --vim-goimports
  use 'mattn/vim-goimports'

  use "ayu-theme/ayu-vim"

  use "sebdah/vim-delve"

  use "petertriho/nvim-scrollbar"

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
  
  -- 括弧補完
  use "vim-denops/denops.vim"
  use "higashi000/dps-kakkonan"

  use "kassio/neoterm"
  use "rcarriga/nvim-notify"
  -- use "nvim-telescope/telescope-frecency.nvim"
  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
    requires = {"kkharji/sqlite.lua"}
  }
 -- use {
 -- "AckslD/nvim-neoclip.lua",
 -- requires = {
 --   {'kkharji/sqlite.lua', module = 'sqlite'},
 --   -- you'll need at least one of these
 --   -- {'nvim-telescope/telescope.nvim'},
 --   -- {'ibhagwan/fzf-lua'},
 -- },
 -- config = function()
 --   require('neoclip').setup()
 -- end,
 -- }

end)

require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    on_attach = function(client, bufnr)
      -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      local opts = { noremap=true, silent=true }
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }
  require('lspconfig')[server].setup(opt)
end})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { separator = true }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { separator = true }
)

-- colorscheme
vim.cmd "colorscheme ayu"

-- telescope-file-browser
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
    frecency = {
      db_root = "home/my_username/path/to/db_root",
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = {"*.git/*", "*/tmp/*"},
      disable_devicons = false,
      workspaces = {
        ["conf"]    = "/home/my_username/.config",
        ["data"]    = "/home/my_username/.local/share",
        ["project"] = "/home/my_username/projects",
        ["wiki"]    = "/home/my_username/wiki"
      }
    }
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

vim.api.nvim_set_var('goimports_simplify', 1)
