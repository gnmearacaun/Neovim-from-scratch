local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = "t"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Normal --
-- Window Navigation
keymap('n', '<M-h>', '<C-w>j', opts)
keymap('n', '<M-l>', '<C-w>k', opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- added by BOD
keymap("i", "kj", "<ESC>", opts)

-- Clear match highlights
keymap("n", "<esc>", ":noh<cr>", opts)

-- Reselect visual after indent
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

-- Search selected text
-- Consistent `*` behaviour
keymap("n", "*", [[*N]], opts)
keymap("v", "*", [[y/\V<c-r>=escape(@",'/\')<cr><cr>N]], opts)

-- Navigating buffers
-- s is used for substitution, maplocalleader to t instead
keymap("n", "tj", ":bprevious<CR>", opts)
keymap("n", "tk", ":bnext<CR>", opts)
keymap("n", "to", ":<C-u>tabnew<CR>", opts)
keymap("n", "tn", ":<C-u>tabnew<CR>", opts)
-- " Toggle between last 2 buffers
keymap("n", "tt", "<C-^>", opts)

-- keymap("n", "tq", ":call CloseBuffer()<CR>", opts)
-- keymap("n", "tx", ":<C-u>call BufferEmpty()<CR>", opts)

-- keymap("n", "ms", "<cmd>MarkdownPreview<CR>", opts)

-- Easy colon, shift not needed
keymap("n", ";", ":", opts)
keymap("v", ";", ":", opts)
keymap("n", ":", ";", opts)
keymap("v", ":", ";", opts)

-- Fast saving
-- keymap("n", "<silent><buffer><C-s>", ":write<CR>", opts)
keymap("n", "<C-s>", ":write<CR>", opts)
keymap("i", "<C-s>", "<C-o>:w<CR>", opts)

-- Y yank until the end of line
keymap("n", "Y", "y$", opts)
keymap("n", "Y", "y$", opts)
-- Move to end of text after yank or paste

-- keymap('v', 'p', 'p`]', opts)

-- Record Macros with 'Q'. Use 'q' for quitting rapidly.
keymap("n", "Q", "<Nop>", opts)
keymap("n", "Q", "q`]", opts)
keymap("n", "q", "<Nop>", opts)
keymap("n", "q", "<C-w>q", opts)
-- keymap("n", "q", ":call SmartQuit()<CR>", opts)
--keymap('n', 'q', 'Q`]', opts)

-- Markdown Preview keybindings
keymap("n", "ms", "<cmd>MarkdownPreview<CR>", opts)
keymap("n", "tm", "<Plug>MarkdownPreviewToggle", opts)

-- autoscroll plugin
keymap("n", "ts", "<cmd>ScrollDown<CR>", opts)
keymap("n", "tu", "<cmd>ScrollUp<CR>", opts)
keymap("n", "te", "<cmd>StopScrolling<CR>", opts)

-- Navigating word wrap
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- keymap("n", "$", "<cmd>lua require'hop'.hint_words()<cr>", {})

-- here be errors
-- keymap("n", "<F5>", "=strftime("\%c")<CR>P", opts)
-- keymap("i", "<F5>", "<C-R>=strftime("\%c")<CR>", opts)

-- other keymappings
vim.cmd([[
" paste on cursor
" nnoremap gP i<CR><Esc>PkJxJx
" nnoremap gp a<CR><Esc>PkJxJx
" delete without yanking
"nnoremap <leader>d "_d
"vnoremap <leader>d "_d
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>
" Save with sudo
cmap W!! w !sudo tee % >/dev/null
" Start an external command with a single she-bang
nnoremap ! :!
" Move to beginning or end of line
nnoremap B ^
nnoremap E $
" so x doesn't clobber paste buffer"
nnoremap x "_x
" Change next match in a repeatable manner
nnoremap cn *``cgn
nnoremap cN *``cgN
vnoremap <expr> cn "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgn"
vnoremap <expr> cN "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgN"
"nnoremap <leader>a =ip    " Indent a paragraph
" Center highlighted search
"nnoremap n nzz
"nnoremap N Nzz
" Move to end of yanked text after yank
vnoremap y y`]
" Move to end of text after paste
nnoremap p p`]
vnoremap p p`]
" Replace current work with last yanked selection
"nnoremap <Leader>. viw"0p
nnoremap cp yap<S-}>p
" Quick substitute within a selected area
"xnoremap s :s//g<Left><Left>
" Select last paste. Except interferes with vimdiff!!
"nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'
" paste line(s) at the bottom of the file
" nnoremap tb :mark '<cr>:$put<cr>`'
let g:AutoScrollSpeed = 800
" Vimwiki 
function! OpenNoteWiki()
  call vimwiki#base#goto_index(2)
"  execute ':Calendar'
endfunction
nnoremap t2 :call OpenNoteWiki()<cr>
function! OpenThisWiki()
  call vimwiki#base#goto_index(3)
endfunction
nnoremap t3 :call OpenThisWiki()<cr>
function! OpenTechWiki()
  call vimwiki#base#goto_index(4)
endfunction
nnoremap t4 :call OpenTechWiki()<cr>
let g:vimwiki_list = [{
          \ 'path': '~/scripts/vimwiki',
          \ 'template_path': '~/scripts/vimwiki/templates/',
          \ 'template_default': 'default',
          \ 'syntax': 'markdown', 
          \ 'ext': '.md',
          \ 'path_html': '~/scripts/vimwiki/site_html/',
          \ 'custom_wiki2html': 'vimwiki_markdown',
          \ 'template_ext': '.tpl'
          \ },
          \ {
              \ 'path': '~/scripts/vimwiki/notewiki',
              \ 'template_path': '~/scripts/vimwiki/templates/',
              \ 'template_default': 'default',
              \ 'syntax': 'markdown',
              \ 'ext': '.md',
              \ 'path_html': '~/scripts/vimwiki/notewiki/site_html/',
              \ 'custom_wiki2html': 'vimwiki_markdown',
              \ 'template_ext': '.tpl'},
              \ {'path': '~/scripts/vimwiki/thiswiki'},
              \ {'path': '~/scripts/vimwiki/techwiki'}
              \]
]])
