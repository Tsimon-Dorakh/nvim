vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- duplicate selected
vim.keymap.set({"v"}, "<C-d>", "y'>p")

-- vim.keymap.set({"n"}, "<C-f5>", "<cmd>!cargo run <CR>")
vim.keymap.set({"n"}, "<C-f5>", function() 
    if vim.bo.filetype == "c" then
        vim.cmd("!gcc % && ./a.out")
    else
        vim.cmd("!cargo run")
    end
end, { noremap = true, silent = true })
