

--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

reload "user.plugins"

reload "user.lsp"

reload "user.treesitter"
reload "user.smoothie"
reload "user.git"

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "\\"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
--add comment with ctrl /
lvim.keys.normal_mode["<C-_>"] = "<Plug>(comment_toggle_linewise_current)"
lvim.keys.visual_mode["<C-_>"] = "<Plug>(comment_toggle_linewise_visual)"

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

lvim.keys.normal_mode["<C-b>"] = "<Cmd>NvimTreeToggle<CR>"

-- keymap("n", "<C-_>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("n", "<C-b>", "* <Cmd>NvimTreeToggle<CR>", opts)
--Remap splits navigation to just SHIFT+ hjkl
keymap("n", "<S-h>", "<C-w>h", opts)
keymap("n", "<S-j>", "<C-w>j", opts)
keymap("n", "<S-k>", "<C-w>k", opts)
keymap("n", "<S-l>", "<C-w>l", opts)
-- Remap swap window to CTRL + hjkl
keymap("n", "<C-H>", "<C-w>H", opts)
keymap("n", "<C-J>", "<C-w>J", opts)
keymap("n", "<C-K>", "<C-w>K", opts)
keymap("n", "<C-L>", "<C-w>L", opts)

keymap("n", "<tab>", "<c-6>", opts)



-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)


function _G.set_terminal_keymaps()

  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<S-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<S-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<S-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<S-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"


-- replace a word with yanked text
keymap("n", "rw","viwpyiw", opts)
-- CTRL A for select all
keymap("n", "<C-a>", "ggVG", opts)
-- replace till the end of line with yanked text
-- keymap("n", "rl", 'Pl"_D', opts)
--This unsets the "last search pattern" register by hitting enter
keymap("n", "<CR>", ":noh <CR><CR>", opts)

-- Open Git DiffView 
keymap("n", "<C-g>","<cmd>DiffviewOpen<cr>", opts)

-- keymap("n", "<m-q>", ":call QuickFixToggle()<cr>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Don't add replaced text to buffer in visual mode
keymap("v", "p", '"_dp', opts)
keymap("v", "P", '"_dP', opts)

vim.api.nvim_set_keymap("n", "yf", "<cmd>lua require('user.functions').copy_relative_path()<cr>", opts)





-- keymap("n", "yf", lv, opts)
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<C-l>',
      node_decremental = '<C-h>',
    },
  }
lvim.builtin.treesitter.textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
 }
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--
-- --
-- require('telescope').setup{
--     defaults = {
--       prompt_prefix = " ???  ",
--       selection_caret = "  ",
--       entry_prefix = "  ",
--         layout_config = {
--                  horizontal = {
--                     prompt_position = "top",
--                     preview_width = 0.55,
--                     results_width = 0.8,
--                  },
--                  vertical = {
--                     mirror = false,
--                  },
--                  width = 0.87,
--                  height = 0.80,
--                  preview_cutoff = 120,
--               },
--     }
-- }
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 120
lvim.builtin.telescope.defaults.layout_config.prompt_position = "bottom"

lvim.builtin.telescope.defaults.prompt_prefix = " ???  "

lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"

lvim.builtin.telescope.defaults.layout_config = {
                 horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                    results_width = 0.8,
                 },
                 vertical = {
                    mirror = false,
                 },
                 width = 0.87,
                 height = 0.80,
                 preview_cutoff = 120,
              }

local function get_pickers(actions)
  return {
    find_files = {
      hidden = true,
    },
    live_grep = {
      --@usage don't include the filename in the search results
      only_sort_text = true,
    },
    grep_string = {
      only_sort_text = true,
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["dd"] = actions.delete_buffer,
        },
      },
    },
    planets = {
      show_pluto = true,
      show_moon = true,
    },
    git_files = {
      theme = "dropdown",
      hidden = true,
      previewer = false,
      show_untracked = true,
    },
    lsp_references = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_definitions = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_declarations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_implementations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
  }
end

 local ok, actions = pcall(require, "telescope.actions")
  if not ok then
    return
  end

--test
lvim.builtin.telescope.defaults.pickers = get_pickers(actions)
lvim.builtin.telescope.defaults.pickers = get_pickers(actions)
lvim.builtin.telescope.pickers = get_pickers(actions)
lvim.builtin.which_key.mappings["f"] = {
  name = "File",
  c = { "<cmd>lua require('user.functions').copy_path()<cr>", "Copy Path" },
  C = { "<cmd>lua require('user.functions').copy_relative_path()<cr>", "Copy Relative Path" },
  v = { "<cmd>vsplit <cr>", "Split Right" },
  h = { "<cmd>sp <cr>", "Split Down" },
}

keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)
lvim.builtin.which_key.mappings["ss"] = { "<cmd>Telescope grep_string<cr>", "Find String" }
-- lvim.builtin.which_key.mappings["f"] = {
--   name = "Find",
--   b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--   c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
--   f = { "<cmd>Telescope find_files<cr>", "Find files" },
--   t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
--   s = { "<cmd>Telescope grep_string<cr>", "Find String" },
--   h = { "<cmd>Telescope help_tags<cr>", "Help" },
--   H = { "<cmd>Telescope highlights<cr>", "Highlights" },
--   i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
--   l = { "<cmd>Telescope resume<cr>", "Last Search" },
--   M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
--   r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
--   R = { "<cmd>Telescope registers<cr>", "Registers" },
--   k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
--   C = { "<cmd>Telescope commands<cr>", "Commands" },
-- }

lvim.builtin.which_key.mappings["g"] = {
  name = "Git",
  -- g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle(12000)<cr>", "Lazygit" },
  g = { "<cmd>DiffviewOpen<cr>", "DiffView" },
  j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
  k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
  l = { "<cmd>GitBlameToggle<cr>", "Blame" },
  p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
  r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
  R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
  s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
  u = {
    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    "Undo Stage Hunk",
  },
  n = { ":!git checkout -b ", "Checkout New Branch" },
  o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
  f = { "<cmd>Telescope git_bcommits<cr>", "Checkout buffer commit" },
  d = {
    "<cmd>Gitsigns diffthis HEAD<cr>",
    "Diff",
  },
  G = {
    name = "Gist",
    a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
    d = { "<cmd>Gist -d<cr>", "Delete" },
    f = { "<cmd>Gist -f<cr>", "Fork" },
    g = { "<cmd>Gist -b<cr>", "Create" },
    l = { "<cmd>Gist -l<cr>", "List" },
    p = { "<cmd>Gist -b -p<cr>", "Create Private" },
  },
}

