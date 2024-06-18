local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-rust")
  }
})

vim.keymap.set("n", "<leader>tc", function()
    neotest.run.run()
end)

