-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  {
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
    end
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
  { "mfussenegger/nvim-jdtls" },
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["<TAB>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-TAB>"] = ":BufferLineCyclePrev<CR>"
lvim.builtin.nvimtree.setup.view.adaptive_size = true

lvim.builtin.which_key.mappings["x"] = {
  "<cmd>BufferKill<CR>", "Kill Buffer"
}

formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "google-java-format",
    filetypes = { "java" },
  }
}
