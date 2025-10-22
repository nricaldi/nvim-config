
-- Tree sitter config
require('nvim-treesitter.configs').setup {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "query",
      "python",
      "html",
      "css",
      "javascript",
      "vue",
      "typescript",
      "tsx"
    },

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- Custom query for Vue template in script tags
local query = [[
  ; Highlight Vue template in specific script tag
  (script_element
    (start_tag
      (attribute
        (attribute_name) @_attr_name
        (quoted_attribute_value (attribute_value) @_attr_value)))
    (raw_text) @injection.content
    (#eq? @_attr_name "type")
    (#eq? @_attr_value "text/x-template")
    (#set! injection.language "vue"))

  ; Highlight CSS in style tag
  (style_element
    (start_tag)
    (raw_text) @injection.content
    (#set! injection.language "css"))

  ; Highlight Vue/JS in regular script tag
  (script_element
    (start_tag)
    (raw_text) @injection.content
    (#set! injection.language "javascript"))
]]

-- Register the query
vim.treesitter.query.set("html", "injections", query)

-- Set up autocommand to apply highlighting
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.html"},
  callback = function()
    vim.treesitter.start(0, "html")
  end
})
