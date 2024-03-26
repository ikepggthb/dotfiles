vim.cmd.packadd "packer.nvim"

require("packer").startup(function()
    use 'tanvirtin/monokai.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'neoclide/coc.nvim'
    use "vim-airline/vim-airline"
end)


require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c","cpp","python"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}

require('monokai').setup {}
