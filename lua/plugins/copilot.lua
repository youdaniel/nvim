return {
  -- copilot
  {
    "zbirenbaum/copilot.lua",
    build = ":Copilot auth",
    opts = {
      panel = { enabled = false },
      suggestion = {
        keymap = { accept = "<M-;>" },
      },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
}
