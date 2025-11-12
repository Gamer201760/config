require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true,       -- показать отфильтрованные как «приглушённые» [web:132]
      hide_dotfiles = false, -- показывать .файлы [web:132]
      hide_gitignored = true, -- по желанию
    },
  },
})
