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

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Tab navigation with Tab+h/l
vim.keymap.set("n", "<Tab>h", ":bprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<Tab>l", ":bnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<Tab>q", ":bdelete<CR>", { desc = "Close tab" })

-- gcc keymap
vim.keymap.set("n", "<leader>cr", function()
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand("%:t")
  local filepath = vim.fn.expand("%:p")
  local dir = vim.fn.expand("%:p:h")

  if filetype == "c" then
    -- Get filename without extension for executable
    local executable = vim.fn.expand("%:t:r")

    -- Compile command
    local compile_cmd = string.format("gcc -o %s %s", executable, filename)

    -- Full command: cd to file directory, compile, and run if successful
    local full_cmd = string.format("cd %s && %s && ./%s", dir, compile_cmd, executable)

    -- Execute in terminal
    vim.cmd("split")
    vim.cmd("terminal " .. full_cmd)
    vim.cmd("startinsert")
  else
    print("Not a C file!")
  end
end, { desc = "Compile and Run C file" })
