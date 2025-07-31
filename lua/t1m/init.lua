require("t1m.remap")
require("t1m.set")
require("t1m.packer")

-- Customize terminal 
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- Auto-save when switching windows or losing focus
vim.api.nvim_create_autocmd({ "WinLeave", "FocusLost" }, {
    pattern = "*",
    command = "silent! write"
})

-- Project specific settings
local project_config = vim.fn.getcwd() .. "/.nvim.lua"
if vim.fn.filereadable(project_config) == 1 then
    dofile(project_config)
end
