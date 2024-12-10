local neotest = require("neotest")

neotest.setup({
    adapters = {
        require("neotest-rust"){
            args = function() return { "--no-capture" } end,
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
    neotest.output_panel.clear()
    neotest.run.run({ extra_args = { "--run-ignored all" } })
end)

vim.keymap.set("n", "<leader>tf", function()
    neotest.run.run(vim.fn.expand("%"))
end)

vim.keymap.set("n", "<leader>to", function()
    neotest.output.open({ enter = true })
    -- neotest.output_panel.toggle()
end)

-- Go to file from test output
-- https://github.com/nvim-neotest/neotest/issues/387#issuecomment-2409133005
vim.api.nvim_create_autocmd('filetype', {
    pattern = 'neotest-output',
    callback = function()
        -- Open file under cursor in the widest window available.
        vim.keymap.set('n', 'gF', function()
            local current_word = vim.fn.expand("<cWORD>")
            local tokens = vim.split(current_word, ":", { trimempty = true })
            local win_ids = vim.api.nvim_list_wins()
            local widest_win_id = -1;
            local widest_win_width = -1;
            for _, win_id in ipairs(win_ids) do
                if (vim.api.nvim_win_get_config(win_id).zindex) then
                    -- Skip floating windows.
                    goto continue
                end
                local win_width = vim.api.nvim_win_get_width(win_id)
                if (win_width > widest_win_width) then
                    widest_win_width = win_width
                    widest_win_id = win_id
                end
                ::continue::
            end
            vim.api.nvim_set_current_win(widest_win_id)
            if (#tokens == 1) then
                vim.cmd("e " .. tokens[1])
            else
                vim.cmd("e +" .. tokens[2] .. " " .. tokens[1])
            end
        end, { remap = true, buffer = true })
    end
})
