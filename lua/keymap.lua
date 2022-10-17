vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<leader><leader>', ':<C-u>cd %:h<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>w', ':<C-u>w<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>q', ':<C-u>bd<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':<C-u>bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-h>', ':<C-u>bprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-W>+', ':<C-u>resize +5<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-W>-', ':<C-u>resize -5<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-W>>', ':<C-u>vertical resize +10<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-W><', ':<C-u>vertical resize -10<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':nohlsearch<CR>', {silent=true})
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', {silent=true})
vim.api.nvim_set_keymap('t', '<C-W>j', '<CMD>wincmd j<CR>', {silent=true})
vim.api.nvim_set_keymap('t', '<C-W>k', '<CMD>wincmd k<CR>', {silent=true})
vim.api.nvim_set_keymap('t', '<C-W>h', '<CMD>wincmd h<CR>', {silent=true})
vim.api.nvim_set_keymap('t', '<C-W>l', '<CMD>wincmd l<CR>', {silent=true})

vim.api.nvim_set_keymap('n', 'tc', '<CMD>tabnew<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'tn', '<CMD>tabnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'tp', '<CMD>tabprevious<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-T><C-T>', '<CMD>Ttoggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-T><C-T>', '<CMD>Tclose!<CR>', {noremap = true})

vim.api.nvim_set_keymap('i', '{', '{}<LEFT>', {noremap = true})
vim.api.nvim_set_keymap('i', '[', '[]<LEFT>', {noremap = true})
vim.api.nvim_set_keymap('i', '(', '()<LEFT>', {noremap = true})
vim.api.nvim_set_keymap('i', '"', '""<LEFT>', {noremap = true})
vim.api.nvim_set_keymap('i', "'", "''<LEFT>", {noremap = true})

opt = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', 'ff', "<cmd>Telescope find_files<CR>", opt)
-- 'tpope/vim-fugitive' --------------------------------------------------------
vim.api.nvim_set_keymap('n', '<leader>GG', ':<C-u>Git<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>GC', ':<C-u>Git commit<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>GP', ':<C-u>Git push<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>GL', ':<C-u>Git log --oneline<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>GD', ':<C-u>vert Gdiffsplit !~1', {noremap = true})
-- Shougo/defx
vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>Telescope file_browser<CR>', {noremap = true})
