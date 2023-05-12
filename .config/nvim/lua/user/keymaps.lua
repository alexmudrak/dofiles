local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
--
-- Attention! If used `whichkey` plugin - all of this options is overriden!
--
-- Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Better window movement
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
-- Nvim tree
map("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
-- Close buffer
map("n", "<leader>q", ":bd<cr>", opts)
-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Move to previous/next
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprev<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Telescope
--[[ map("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts) ]]
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
-- Move control
map("n", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
map("n", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })
map("n", "J", "10j", opts)
map("n", "K", "10k", opts)
-- Move lines in normal/insert modes
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
-- Move lines in visual mode
map("v", "<A-j>", ":m '>+1<CR>gv-gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv-gv", opts)
-- Comment
map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise()<CR>", opts)
-- Fortmatter
map("n", "<leader>fm", ":lua vim.lsp.buf.format({timeout_ms=2000})<CR>", opts)
-- Copilot
-- Terminal
map("n", "<M-1>", "<cmd>:ToggleTerm size=20 direction=horizontal<CR>", opts)
