return {
  "iamcco/markdown-preview.nvim",
  config = function()
    vim.fn["mkdp#util#install"]()
  end,
  ft = "markdown",
  cmd = "MarkdownPreview",
}
