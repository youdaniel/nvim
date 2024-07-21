-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        clipboard = "unnamed",
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        ["<Leader>y"] = { "<cmd>%y+<cr>", desc = "Copy buffer" },
      },
      i = {
        ["<C-v>"] = { '<ESC>"+p', desc = "Paste selection" },
      },
      v = {
        ["<C-c>"] = { '"+yi', desc = "Copy selection" },
        ["<C-v>"] = { 'c<ESC>"+p', desc = "Paste selection" },
      },
    },
  },
}
