-- 行番号を表示
vim.opt.number = true

-- タブ文字の代わりにスペースを使う
vim.opt.expandtab = true

-- プログラミング言語に合わせて適切にインデントを自動挿入
vim.opt.smartindent = true

-- 各コマンドやsmartindentで挿入する空白の量
vim.opt.shiftwidth = 4

-- Tabキーで挿入するスペースの数
vim.opt.softtabstop = 4

-- カレントディレクトリを自動で移動
vim.opt.autochdir = true

-- バッファ内で扱う文字コード
vim.opt.encoding = "utf-8"

-- 書き込む文字コード : この場合encodingと同じなので省略可
vim.opt.fileencoding = "utf-8"

-- 読み込む文字コード : この場合UTF-8を試し、だめならShift_JIS
vim.opt.fileencodings = {"utf-8", "cp932"}

-- Vimの無名レジスタとシステムのクリップボードを連携 : ダメならxclipをインストールで使えるかも
vim.opt.clipboard = {"unnamed", "unnamedplus"}

-- eコマンド等でTabキーを押すとパスを保管する : この場合まず最長一致文字列まで補完し、2回目以降は一つづつ試す
vim.opt.wildmode = {"longest", "full"}

-- jfで戻れるように
vim.api.nvim_set_keymap("i", "jf", "<ESC>", {})

-- C++,Java等のインラインブロックを中括弧付きのブロックに展開
vim.api.nvim_set_keymap("n", "<C-j>", "^/({<CR>%a}<ESC>o", {})

-- カーソル上の単語を置換
vim.api.nvim_set_keymap("n", "<expr> S*", ":%s/\\<" .. vim.fn.expand("<cword>") .. "\\>/", {})

-- インサートモードでShift+Tabで補完リストを前に移動
vim.api.nvim_set_keymap("i", "<S-Tab>", "<Cmd>call pum#map#insert_relative(-1)<CR>", {silent = true, noremap = true})

-- 挿入モード終了時にIMEをオフ
vim.api.nvim_set_keymap("i", "<Esc>", "<Esc>:call system('fcitx5-remote -c')<CR>", {silent = true, noremap = true})


-- 背景などは端末の色設定を強制
vim.cmd('hi Normal guibg=NONE')
vim.cmd('hi LineNr guibg=NONE')
vim.cmd('hi VertSplit guibg=NONE')
vim.cmd('hi Special guibg=NONE')
vim.cmd('hi Identifier guibg=NONE')
