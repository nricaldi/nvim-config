vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.syntax = "on"
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars:append("space:.")
vim.opt.listchars:append("tab:->")
vim.opt.signcolumn = "yes"

vim.g.mapleader = " "

-- Set default shiftwidth to 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Set shiftwidth=4 for Python files
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"python", "html"},
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

-- vim motions to swap between nvim panes
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Show Tree sitter highlight group info
local function get_ts_highlight_info()
    local line, col = vim.fn.line("."), vim.fn.col(".")
    local buf = vim.api.nvim_get_current_buf()

    if not vim.treesitter then
        print("Treesitter is not available")
        return
    end

    local parser = vim.treesitter.get_parser(buf)
    if not parser then
        print("No parser available for this buffer")
        return
    end

    local tree = parser:parse()[1]
    local root = tree:root()
    local node = root:named_descendant_for_range(line-1, col-1, line-1, col-1)

    if node then
        local node_stack = {}
        while node do
            table.insert(node_stack, 1, node:type())
            node = node:parent()
        end
        print("Tree-sitter nodes: " .. table.concat(node_stack, " > "))

        -- Get highlight information
        local captures = vim.treesitter.get_captures_at_pos(buf, line - 1, col - 1)
        if #captures > 0 then
            print("\nTheme file format:")
            local seen = {}
            for _, capture in ipairs(captures) do
                if not seen[capture.capture] then
                    seen[capture.capture] = true
                    print(string.format('  ["@%s"] = { link = "YOUR_HIGHLIGHT_GROUP" },', capture.capture))
                end
            end
            print("\nReplace 'YOUR_HIGHLIGHT_GROUP' with the desired highlight group or specific color settings.")
        else
            print("No captures found at cursor position")
        end
    else
        print("No Tree-sitter node found at cursor")
    end
end

vim.api.nvim_create_user_command('TSHighlightInfo', get_ts_highlight_info, {})
vim.api.nvim_set_keymap('n', '<F10>', ':TSHighlightInfo<CR>', { noremap = true, silent = true })
