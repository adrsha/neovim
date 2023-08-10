local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- NVIM MODIFICATIONS
-- Move current line / block with Alt-j/k ala vscode.
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("c", "W", ":w !sudo tee % > /dev/null<CR>")
-- Move current line / block with Alt-j/k ala vscode.

-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move current line / block with Alt-j/k a la vscode.
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-Up>", "<C-\\><C-N><C-w>k")
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv-gv")
vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv-gv")

-- Find all instances of the word
vim.keymap.set("n", "<C-n>", "*")
-- Find next bracket
vim.keymap.set("n", "<leader>n", "%")

-- Tabs dont unselect the selection
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

--Mason
vim.keymap.set("n", "<leader>m", "<CMD>Mason<CR>")

--Mason
vim.keymap.set("n", "<leader>l", "<CMD>Lazy<CR>")

--Sayonara
vim.keymap.set("n", "<leader>bd", "<CMD>bdelete<CR>")

-- Comments
-- In /setups/comments.nvim

-- HighlightColor
-- Use :HighlightColorToggle/HighlightColorOn/HighlightColorOff on the cmd itself

--Replace
vim.keymap.set("n", "<C-s>", ":%s/")
vim.keymap.set("i", "<C-s>", "<Esc>:%s/")

-- Buffer
vim.keymap.set("n", "<Tab>", "<CMD>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<CMD>bprev<CR>")


-- BetterEscape
-- In /setups/betterescape.lua



-- Surround.nvim
-- Using the defaults


--Telescope
vim.keymap.set("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>")
vim.keymap.set("n", "<leader>lg", "<CMD>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>ss", "<CMD>Telescope spell_suggest<CR>")
vim.keymap.set("n", "<leader>ff", "<CMD>Telescope fd<CR>")
-- Telescope shortcuts are in setups/Telescope

-- Dressing.nvim
-- in /-- In /setups/dressing.lua


-- LSP KEYMAPS
vim.keymap.set("n", "<C-<>", vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set("n", "<C->>", vim.diagnostic.goto_next, opts)

-- More on /setup/nvimlsp


-- Icon Picker
-- vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
-- vim.keymap.set("n", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)


--FTERM
vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')


vim.keymap.set("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
vim.keymap.set("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
vim.keymap.set("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
vim.keymap.set("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
-- vim.keymap.set("i", "<c-f>", "i<Esc>==<S-a><BS>", opts)
-- vim.keymap.set("i", "<c-f>", "<Esc>ddkA<CR>", opts)

vim.cmd [[

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]]

--Neotree
vim.keymap.set("n", "\\", "<cmd>Neotree<CR>", opts)

--Flutter
vim.keymap.set("n", "<leader><leader>f", "<cmd>FlutterRun<CR>", opts)
vim.keymap.set("n", "<leader><leader>r", "<cmd>FlutterReload<CR>", opts)
vim.keymap.set("n", "<leader><leader>R", "<cmd>FlutterRestart<CR>", opts)


-- treesitter unit
vim.api.nvim_set_keymap('x', 'iu', ':lua require"treesitter-unit".select()<CR>', { noremap = true })
vim.api.nvim_set_keymap('x', 'au', ':lua require"treesitter-unit".select(true)<CR>', { noremap = true })
vim.api.nvim_set_keymap('o', 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>', { noremap = true })
vim.api.nvim_set_keymap('o', 'au', ':<c-u>lua require"treesitter-unit".select(true)<CR>', { noremap = true })
