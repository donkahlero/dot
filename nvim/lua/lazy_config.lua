local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "bazelbuild/vim-bazel",
    dependencies = {
      "bazelbuild/vim-ft-bzl",
      "google/vim-maktaba",
    },
  },
  {
    'dense-analysis/ale',
    config = function()
      local g = vim.g
      g.ale_ruby_rubocop_auto_correct_all = 1
      g.ale_linters = {
        go = {'golangci-lint', 'gofumpt'},
        javascript = {'prettier', 'eslint'},
        lua = {'lua_language_server'},
        typescript = {'prettier', 'eslint'}
      }
    end
  },
  {
    "dracula/vim",
    name = "dracula",
    priority = 1000,
  },
  "fatih/vim-go",
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "Bilal2453/luvit-meta",
    lazy = true
  },
  'habamax/vim-asciidoctor',
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function ()
          require("copilot_cmp").setup()
        end,
        dependencies = {
          {
            "zbirenbaum/copilot.lua",
            cmd = "Copilot",
            event = "InsertEnter",
            config = function()
              require("copilot").setup({})
            end
          }
        }
      },
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
    },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0,
      })
    end,
  },
  {
    "lambdalisue/fern.vim",
    dependencies = {
      "lambdalisue/fern-renderer-nerdfont.vim",
      "lambdalisue/vim-fern-git-status",
      "lambdalisue/glyph-palette.vim",
      "lambdalisue/nerdfont.vim",
      "andykog/fern-highlight.vim",
    },
  },
  "leoluz/nvim-dap-go",
  "lewis6991/gitsigns.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "mhinz/vim-startify",
  "neovim/nvim-lspconfig",
  "ntpeters/vim-better-whitespace",
  "numToStr/Comment.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-tree/nvim-web-devicons",
  "nvim-treesitter/nvim-treesitter",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },
  "rcarriga/nvim-notify",
  "romgrk/barbar.nvim",
  "roxma/nvim-yarp",
  "roxma/vim-hug-neovim-rpc",
  "t9md/vim-choosewin",
  "tpope/vim-cucumber",
  "tpope/vim-fugitive",
  "vim-airline/vim-airline",
  "vim-denops/denops.vim",
}

require("lazy").setup(plugins)

