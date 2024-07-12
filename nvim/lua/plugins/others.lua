return {
  -- I have a separate config.mappings file where I require which-key.
  { "dstein64/vim-startuptime", cmd = "StartupTime", init = function() vim.g.startuptime_tries = 10 end },
  -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
  -- So for api plugins like devicons, we can always set lazy=true
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- you can use the VeryLazy event for things that can
  -- load later and are not important for the initial UI
  { "stevearc/dressing.nvim", event = "VeryLazy" },

  { "Wansmer/treesj", opts = { use_default_keymaps = false, max_join_length = 150 } },

  -- local plugins need to be explicitly configured with dir
  { dir = "~/projects/secret.nvim" },
}
