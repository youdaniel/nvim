return {
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin" } },

  -- comment
  { "echasnovski/mini.comment", enabled = false },
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    event = "VeryLazy",
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    opts = {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    },
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },

  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      worktrees = {
        {
          toplevel = vim.env.HOME,
          gitdir = vim.env.HOME .. "/.cfg",
        },
      },
    },
  },

  -- mini.ai
  {
    "echasnovski/mini.ai",
    opts = function(_, opts)
      opts.custom_textobjects["t"] = false
    end,
  },

  -- neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.window.mappings = vim.tbl_extend("force", opts.window.mappings, { ["l"] = "open" })
    end,
  },

  -- noice
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.routes = {
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        },
      }
    end,
  },

  -- surround
  { "echasnovski/mini.surround", enabled = false },
  { "kylechui/nvim-surround", event = "VeryLazy", config = true },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require("telescope.actions")
      local m = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
      opts.defaults.mappings.i = vim.tbl_extend("force", opts.defaults.mappings.i, m)
      opts.defaults.mappings.n = vim.tbl_extend("force", opts.defaults.mappings.n, m)
      opts.defaults.layout_strategy = "flex"
      opts.defaults.layout_config = { horizontal = { preview_cutoff = 0 } }
      opts.defaults.path_display = { "smart" }
    end,
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { { "windwp/nvim-ts-autotag" } },
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed, { "css", "svelte" })
      opts.autotag = { enable = true }
    end,
  },

  { "echasnovski/mini.pairs", enabled = false },
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "windwp/nvim-autopairs", opts = {} },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
  },
}
