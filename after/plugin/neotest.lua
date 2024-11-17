local neotest = require("neotest")

neotest.setup({
    adapters = {
        require("neotest-rust"){
            args = { "--no-capture" },
        }
    }
})

vim.keymap.set("n", "<leader>ts", function()
    neotest.summary.toggle()
end)

vim.keymap.set("n", "<leader>tw", function()
    neotest.watch.toggle()
end)

vim.keymap.set("n", "<leader>tc", function()
    -- require("neotest").run.run({ extra_args = { "--run-ignored all" } })
    -- extra_args causes duplicates in args after 2nd call 
    require("neotest").run.run()
end)

vim.keymap.set("n", "<leader>tf", function()
    neotest.run.run(vim.fn.expand("%"))
end)

vim.keymap.set("n", "<leader>to", function()
    neotest.output.open({ enter = true })
end)
