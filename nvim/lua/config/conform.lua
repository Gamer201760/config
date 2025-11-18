local conform = require("conform")

conform.setup({
  -- Для каждого filetype укажем форматтеры.
  -- Порядок важен: сначала фикс (lint --fix), затем форматирование, затем импорты. [web:110]
  formatters_by_ft = {
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },  -- официальная рекомендация Ruff [web:42]
    lua    = { "stylua" },
    -- go     = { "gofumpt" },  -- или "goimports", "golines" при желании
    -- rust   = { "rustfmt" },
    -- добавляй другие по вкусу
  },

  -- Форматировать при сохранении
  format_on_save = function(bufnr)
    -- Для Python можно отключить LSP-fallback, чтобы не конфликтовать с Ruff LSP-форматом
    if vim.bo[bufnr].filetype == "python" then
      return { timeout_ms = 3000, lsp_fallback = false }
    end
    -- Для остальных — разрешить LSP fallback
    return { timeout_ms = 2000, lsp_fallback = true }
  end,
})
