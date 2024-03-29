require("toggleterm").setup({
  open_mapping = [[<c-\>]],
  shading_factor = 2,
  start_in_insert = true,
  close_on_exit = true,
  insert_mapping = true,
  terminal_mapping = true,
  hide_numbers = true,
  direction = "float",
  size = 10,
  float_opts = {
    border = "rounded",
    windblend = 0,
    title_pos = "center",
    highlights = {
      border = "Normal",
      background = "Normal",
    },

  },
  winbar = {
    enabled = true,
    name_formatter = function(term) --  term: Terminal
      return term.count
    end,
  },

  shell = "cmd.exe /C zsh",
})



local opts = { noremap = true }
function _G.set_terminal_keymaps()
  -- Lua mappings for terminal

  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<jj>", [[<C-\><C-n>]], opts)
end

--
vim.api.nvim_create_autocmd({ "TermEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "startinsert"
    _G.set_terminal_keymaps()
  end,
})
