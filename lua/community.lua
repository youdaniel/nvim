-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.catppuccin" },

  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.comment.ts-comments-nvim" },

  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- import/override with your plugins folder
}
