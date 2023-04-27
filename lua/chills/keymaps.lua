local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- NVIM MODIFICATIONS
-- Move current line / block with Alt-j/k ala vscode.
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("c", "W", ":w !sudo tee % > /dev/null<CR>")
-- Move current line / block with Alt-j/k ala vscode.

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
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

-- Tabs dont unselect the selection
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

--Mason
vim.keymap.set("n", "<leader>m", "<CMD>Mason<CR>")

--Sayonara
vim.keymap.set("n", "<leader>cc", "<CMD>w | Sayonara<CR>")

-- Comments
-- In /setups/comments.nvim

-- HighlightColor
-- Use :HighlightColorToggle/HighlightColorOn/HighlightColorOff on the cmd itself

-- Buffer
vim.keymap.set("n", "<S-l>", "<CMD>bnext<CR>")
vim.keymap.set("n", "<S-h>", "<CMD>bprev<CR>")



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
vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
vim.keymap.set("n", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)



-- Search and Replace
vim.keymap.set({ "n", "x" }, "<leader>sr", function() require("ssr").open() end)




vim.cmd [[

" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'

" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]]
