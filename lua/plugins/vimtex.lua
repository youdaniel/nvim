return {
  "lervag/vimtex",
  lazy = false,
  init = function() vim.g.vimtex_view_method = "zathura" end,
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      autocmds = {
        vimtex_mapping_descriptions = {
          {
            event = "FileType",
            desc = "Set up VimTex Which-Key descriptions",
            pattern = "tex",
            callback = function(event)
              local wk_avail, wk = pcall(require, "which-key")
              if not wk_avail then return end
              local opts = {
                mode = "n", -- NORMAL mode
                buffer = event.buf, -- Specify a buffer number for buffer local mappings to show only in tex buffers
              }
              local mappings = {
                { "<localleader>l", buffer = 1, group = "VimTeX" },
                { "<localleader>lC", buffer = 1, desc = "Full Clean" },
                { "<localleader>lG", buffer = 1, desc = "Show Status for All" },
                { "<localleader>lI", buffer = 1, desc = "Show Full Info" },
                { "<localleader>lK", buffer = 1, desc = "Stop All VimTeX" },
                { "<localleader>lL", buffer = 1, desc = "Compile Selection" },
                { "<localleader>lT", buffer = 1, desc = "Toggle Table of Contents" },
                { "<localleader>lX", buffer = 1, desc = "Reload VimTeX State" },
                { "<localleader>la", buffer = 1, desc = "Show Context Menu" },
                { "<localleader>lc", buffer = 1, desc = "Clean" },
                { "<localleader>le", buffer = 1, desc = "Show Errors" },
                { "<localleader>lg", buffer = 1, desc = "Show Status" },
                { "<localleader>li", buffer = 1, desc = "Show Info" },
                { "<localleader>lk", buffer = 1, desc = "Stop VimTeX" },
                { "<localleader>ll", buffer = 1, desc = "Compile" },
                { "<localleader>lm", buffer = 1, desc = "Show Imaps" },
                { "<localleader>lo", buffer = 1, desc = "Show Compiler Output" },
                { "<localleader>lq", buffer = 1, desc = "Show VimTeX Log" },
                { "<localleader>ls", buffer = 1, desc = "Toggle Main" },
                { "<localleader>lt", buffer = 1, desc = "Open Table of Contents" },
                { "<localleader>lv", buffer = 1, desc = "View Compiled Document" },
                { "<localleader>lx", buffer = 1, desc = "Reload VimTeX" },
                { "[*", buffer = 1, desc = "Previous end of a LaTeX comment" },
                { "[/", buffer = 1, desc = "Previous start of a LaTeX comment" },
                { "[M", buffer = 1, desc = "Previous \\end" },
                { "[N", buffer = 1, desc = "Previous end of a math zone" },
                { "[R", buffer = 1, desc = "Previous \\end{frame}" },
                { "[[", buffer = 1, desc = "Previous beginning of a section" },
                { "[]", buffer = 1, desc = "Previous end of a section" },
                { "[m", buffer = 1, desc = "Previous \\begin" },
                { "[n", buffer = 1, desc = "Previous start of a math zone" },
                { "[r", buffer = 1, desc = "Previous \\begin{frame}" },
                { "]*", buffer = 1, desc = "Next end of a LaTeX comment %" },
                { "]/", buffer = 1, desc = "Next start of a LaTeX comment %" },
                { "]M", buffer = 1, desc = "Next \\end" },
                { "]N", buffer = 1, desc = "Next end of a math zone" },
                { "]R", buffer = 1, desc = "Next \\end{frame}" },
                { "][", buffer = 1, desc = "Next beginning of a section" },
                { "]]", buffer = 1, desc = "Next end of a section" },
                { "]m", buffer = 1, desc = "Next \\begin" },
                { "]n", buffer = 1, desc = "Next start of a math zone" },
                { "]r", buffer = 1, desc = "Next \\begin{frame}" },
                { "cs$", buffer = 1, desc = "Change surrounding math zone" },
                { "csc", buffer = 1, desc = "Change surrounding command" },
                { "csd", buffer = 1, desc = "Change surrounding delimiter" },
                { "cse", buffer = 1, desc = "Change surrounding environment" },
                { "ds$", buffer = 1, desc = "Delete surrounding math zone" },
                { "dsc", buffer = 1, desc = "Delete surrounding command" },
                { "dsd", buffer = 1, desc = "Delete surrounding delimiter" },
                { "dse", buffer = 1, desc = "Delete surrounding environment" },
                { "ts", buffer = 1, group = "VimTeX Toggles & Cycles" },
                { "ts$", buffer = 1, desc = "Cycle inline, display & numbered equation" },
                { "tsD", buffer = 1, desc = "Reverse Cycle (), \\left(\\right) [, ...]" },
                { "tsc", buffer = 1, desc = "Toggle star of command" },
                { "tsd", buffer = 1, desc = "Cycle (), \\left(\\right) [,...]" },
                { "tse", buffer = 1, desc = "Toggle star of environment" },
                { "tsf", buffer = 1, desc = "Toggle a/b vs \\frac{a}{b}" },
              }
              wk.add(mappings, opts)
              -- VimTeX Text Objects without variants with targets.vim
              opts = {
                mode = "o", -- Operator pending mode
                buffer = event.buf,
              }
              local objects = {
                {
                  mode = { "o" },
                  { "a$", buffer = 1, desc = "LaTeX Math Zone" },
                  { "aP", buffer = 1, desc = "LaTeX Section, Paragraph, ..." },
                  { "ac", buffer = 1, desc = "LaTeX Command" },
                  { "ad", buffer = 1, desc = "LaTeX Math Delimiter" },
                  { "ae", buffer = 1, desc = "LaTeX Environment" },
                  { "am", buffer = 1, desc = "LaTeX Item" },
                  { "i$", buffer = 1, desc = "LaTeX Math Zone" },
                  { "iP", buffer = 1, desc = "LaTeX Section, Paragraph, ..." },
                  { "ic", buffer = 1, desc = "LaTeX Command" },
                  { "id", buffer = 1, desc = "LaTeX Math Delimiter" },
                  { "ie", buffer = 1, desc = "LaTeX Environment" },
                  { "im", buffer = 1, desc = "LaTeX Item" },
                },
              }
              wk.add(objects, opts)
            end,
          },
        },
      },
    },
  },
}
