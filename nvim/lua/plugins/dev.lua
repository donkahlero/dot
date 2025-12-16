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
        go = { "gofmt", "staticcheck", "govet" },
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
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "neoclide/coc.nvim",
        branch = "release",
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
      lsp_cfg = true,
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
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = '1.*',
    opts = {
      keymap = {
        preset = "default",
      },
      appearance = {
        nerd_font_variant = "mono"
      },
      completion = {
        documentation = {
          auto_show = false,
        },
      },
      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      }
    },
    opts_extend = {
      "sources.default",
    },
  },
  "tpope/vim-cucumber",
  "tpope/vim-fugitive",
}
