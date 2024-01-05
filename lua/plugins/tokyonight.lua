return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
	  		--set tokyo theme below
    vim.cmd[[colorscheme tokyonight-night]]
  end
}
