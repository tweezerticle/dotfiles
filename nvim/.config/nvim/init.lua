-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Enable line wrap in LaTeX files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.opt_local.wrap = true
  end,
})
