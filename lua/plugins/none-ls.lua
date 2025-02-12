return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "gbprod/none-ls-shellcheck.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        require("none-ls.diagnostics.eslint_d"), -- javascript and typescript
        require("none-ls.diagnostics.flake8"),  -- python
        require("none-ls-shellcheck.diagnostics"), --bash
        require("none-ls-shellcheck.code_actions"), --bash
        null_ls.builtins.diagnostics.rubocop,   --rubocop

        require("none-ls.formatting.beautysh"), --bash
        null_ls.builtins.formatting.stylua,     --lua
        null_ls.builtins.formatting.prettier,   --javascript and typescript
        null_ls.builtins.formatting.black,      -- python
        null_ls.builtins.formatting.isort,      -- python
        null_ls.builtins.formatting.rubocop,    -- rubocop
      },
    })

    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
  end,
}
