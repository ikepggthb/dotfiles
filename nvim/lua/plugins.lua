vim.cmd.packadd "packer.nvim"

require("packer").startup(function()
    use "Shougo/ddc.vim"
    use "vim-denops/denops.vim"
    use "Shougo/pum.vim"
    use "Shougo/ddc-around"
    use "LumaKernel/ddc-file"
    use "Shougo/ddc-matcher_head"
    use "Shougo/ddc-sorter_rank"
    use "Shougo/ddc-converter_remove_overlap"
    use "mattn/vim-lsp-settings"
    use "prabirshrestha/vim-lsp"
    use 'tanvirtin/monokai.nvim'
    use 'nvim-treesitter/nvim-treesitter'
end)


require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c","cpp","python"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}

require('monokai').setup {}
