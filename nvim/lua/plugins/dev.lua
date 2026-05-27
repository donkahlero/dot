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
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { "lsp", "indent" }
      end,
    },
    config = function(_, opts)
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      require("ufo").setup(opts)
    end,
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   init = function()
  --     vim.lsp.enable("copilot")
  --   end,
  -- },
  "numToStr/Comment.nvim",
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
    },
    opts = {
      lsp_inlay_hints = {
        enable = false,
      },
      lsp_cfg = true,
    },
    config = function(lp, opts)
      require("go").setup(opts)
      local gopls_cfg = require("go.lsp").config()
      vim.lsp.config.gopls = gopls_cfg
      vim.lsp.enable("gopls")
    end,
    event = {"CmdlineEnter"},
    ft = {"go", "gomod"},
    build = ":lua require(\"go.install\").update_all_sync()"
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
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    opts = {
      interactions = {
        chat = {
          adapter = {
            name = "copilot",
            model = "claude-opus-4.6",
          },
          adapter = {
            name = "kiro",
            model = "claude-opus-4.6",
          },
        },
        cli = {
          agent = "copilot",
          agents = {
            copilot = {
              cmd = "copilot",
              args = {
                "--model",
                "claude-opus-4.6",
              },
              description = "GitHub Copilot CLI",
            },
            kiro = {
              cmd = "kiro-cli",
              args = {},
              description = "Kiro CLI",
            },
          },
        },
        inline = {
          adapter = {
            name = "copilot",
            model = "claude-opus-4.6",
          },
        },
      },
      display = {
        chat = {
          show_token_count = true,
          window = {
            buflisted = true,
            sticky = true,
            position = "right",
            width = 0.25,
            opts = {
              number = false,
              relativenumber = false,
            },
          },
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
    },
  },
  {
    "saghen/blink.cmp",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "1.*",
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
        per_filetype = {
          codecompanion = { "codecompanion" },
        }
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      }
    },
    opts_extend = {
      "sources.default",
    },
  },
  {
    "tigion/nvim-asciidoc-preview",
    ft = { "asciidoc" },
    build = "cd server && npm install --omit=dev --no-save",
    ---@module "asciidoc-preview"
    ---@type asciidoc-preview.Config
    opts = {
      -- Add user configuration here
    },
  },
  "tpope/vim-cucumber",
  "tpope/vim-fugitive",
}
