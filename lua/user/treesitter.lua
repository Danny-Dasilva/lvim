if lvim.colorscheme == "darkplus" then
	lvim.builtin.treesitter.rainbow = {
		enable = true,
		extended_mode = false,
		colors = {
			"DodgerBlue",
			"Orchid",
			"Gold",
		},
		disable = { "html" },
	}
end

lvim.builtin.treesitter.ensure_installed = "all"
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = true,
    },
  },
}

lvim.builtin.treesitter.textobjects = {
	select = {
		enable = true,
		-- Automatically jump forward to textobj, similar to targets.vim
		lookahead = true,
		keymaps = {
			-- You can use the capture groups defined in textobjects.scm
			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["at"] = "@class.outer",
			["it"] = "@class.inner",
			["ac"] = "@call.outer",
			["ic"] = "@call.inner",
			["aa"] = "@parameter.outer",
			["ia"] = "@parameter.inner",
			["al"] = "@loop.outer",
			["il"] = "@loop.inner",
			["ai"] = "@conditional.outer",
			["ii"] = "@conditional.inner",
			["a/"] = "@comment.outer",
			["i/"] = "@comment.inner",
			["ab"] = "@block.outer",
			["ib"] = "@block.inner",
			["as"] = "@statement.outer",
			["is"] = "@scopename.inner",
			["aA"] = "@attribute.outer",
			["iA"] = "@attribute.inner",
			["aF"] = "@frame.outer",
			["iF"] = "@frame.inner",
		},
     -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
	},
}
