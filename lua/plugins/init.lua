return {
 "nvim-lua/plenary.nvim",

 {
   "nvchad/ui",
    config = function()
      require "nvchad"
    end
 },

 {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
 },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "python",
       "kotlin", "java"
  		},
  	},
  },

  {
    'machakann/vim-highlightedyank',
    event = 'TextYankPost',
    config = function()
    end
  },

  {
    "manuuurino/autoread.nvim",
    lazy = false,
    config = function()
      require("autoread").setup({
        notify = true, -- The plugin's default notify system will now route directly to nvim-notify!
      })
    end,
  },

  {
    "CRAG666/code_runner.nvim",
    config = function()
      require('code_runner').setup({
        filetype = {
          java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
          python = "python3 -u",
          typescript = "deno run",
          javascript = "node",
          cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
        },
      })
    end,
    -- Lazy load on command
    cmd = { "RunCode", "RunFile", "RunProject" },
  },
}
