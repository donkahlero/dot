return {
  {
    "bazelbuild/vim-bazel",
    dependencies = {
      "bazelbuild/vim-ft-bzl",
      "google/vim-maktaba",
    },
  },
  "fatih/vim-go",
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
  "leoluz/nvim-dap-go",
  "neovim/nvim-lspconfig",
  "numToStr/Comment.nvim",
  "tpope/vim-cucumber",
  "tpope/vim-fugitive",
}
