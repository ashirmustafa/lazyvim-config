-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Disable arrow keys in ALL modes like a true vim chad
local modes = { "n", "i", "v", "x", "c" }

for _, mode in pairs(modes) do
  vim.keymap.set(mode, "<Up>", "<Nop>", { desc = "Disabled" })
  vim.keymap.set(mode, "<Down>", "<Nop>", { desc = "Disabled" })
  vim.keymap.set(mode, "<Left>", "<Nop>", { desc = "Disabled" })
  vim.keymap.set(mode, "<Right>", "<Nop>", { desc = "Disabled" })
end

-- Optional: Show a message when someone tries to use them
vim.keymap.set("n", "<Up>", function()
  print("Use k, you coward!")
end)
vim.keymap.set("n", "<Down>", function()
  print("Use j, you coward!")
end)
vim.keymap.set("n", "<Left>", function()
  print("Use h, you coward!")
end)
vim.keymap.set("n", "<Right>", function()
  print("Use l, you coward!")
end)

-- Easy terminal escape (way better than Ctrl+\ Ctrl+n)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode with jk" })
vim.keymap.set("t", "<C-c>", "<C-\\><C-n>", { desc = "Exit terminal mode with Ctrl+c" })
