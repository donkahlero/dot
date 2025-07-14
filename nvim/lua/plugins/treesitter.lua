return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "c", "cpp", "go", "lua", "python" },
    sync_install = false,
    auto_install = true,
    ignore_install = { "javascript" },

    highlight = {
      enable = true,
      disable = { },
      additional_vim_regex_highlighting = false,
    },
  },
}
