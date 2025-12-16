return {
  {
    "bazelbuild/vim-bazel",
    dependencies = {
      "bazelbuild/vim-ft-bzl",
      "google/vim-maktaba",
    },
  },
  {
    "dense-analysis/ale",
    config = function()
      local g = vim.g

      g.ale_fix_on_save = 1

      g.ale_linters = {
        go = { "gopls", "gofmt", "staticcheck", "govet", "golangci-lint" },
        mail = { "proselint" },
        markdown = { "proselint", "vale" },
      }

      g.ale_fixers = {
        go = { "goimports", "gofumpt" },
        ["*"] = { "remove_trailing_lines", "trim_whitespace" },
      }
    end
  },
  "dmix/elvish.vim",
  "habamax/vim-asciidoctor",
  {
    "hrsh7th/nvim-cmp",
    event = 'InsertEnter',
    dependencies = {
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
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
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "neoclide/coc.nvim",
        run = "yarn install --frozen-lockfile",
      },
    },
  },
  "neovim/nvim-lspconfig",
  "numToStr/Comment.nvim",
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lsp_inlay_hints = {
        enable = false,
      },
    },
    config = function(lp, opts)
      require("go").setup(opts)
      local gopls_cfg = require('go.lsp').config()
      vim.lsp.config.gopls = gopls_cfg
      vim.lsp.enable('gopls')
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "ray-x/navigator.lua",
    dependencies = {
      {
        "ray-x/guihua.lua",
        build = "cd lua/fzy && make",
      },
      { "neovim/nvim-lspconfig" },
    },
  },
  "tpope/vim-cucumber",
  "tpope/vim-fugitive",
}
