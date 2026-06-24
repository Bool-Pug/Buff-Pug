require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n"," w", ":w<enter>")
map("n"," q", ":q<enter>")
map("n", "<leader>rc", ":RunCode<CR>", { desc = "Run Code" })
map("n", "<leader>rf", ":RunFile<CR>", { desc = "Run File" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
