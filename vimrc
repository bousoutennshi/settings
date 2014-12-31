"" 検索系設定
" インクリメンタルサーチ
set incsearch
" 大文字と小文字を無視する
set ignorecase
" 検索パターンが大文字を含んでいたらignorecaseを上書きする
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する
set wrapscan
" 閉じ括弧が入力された時、対応する開き括弧にわずかの間ジャンプする
set showmatch


"" syntax系設定
" 構文ハイライト
syntax enable
" マッチするテキストを強調表示する
set hlsearch
" ESC2回で強調表示をやめる
nmap <ESC><ESC> :nohlsearch<CR><ESC>


"" color系の設定
" 256色を利用する
set term=xterm-256color
" set t_Co=256
"colorscheme desert


"" ステータスライン系設定
" ステータスライン
function! GetTime()
 let str = ""
 let str = strftime(" %Y-%m-%d %a %H:%M ")
 return str
endfunction
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P,%{GetTime()}
" set statusline=[%n]\ %<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%b\ 0x%B\ %l/%L,%c%V%5P%{GetTime()}
set laststatus=2
" ステータスラインColor
if v:version >= 700
 augroup InsertHook
 autocmd!
 autocmd InsertEnter * highlight StatusLine ctermfg=164 ctermbg=7
 autocmd InsertLeave * highlight StatusLine ctermfg=164 ctermbg=7
 augroup END
endif


"" WriteSpace系設定
" Insertモードで<Tab>を挿入するのに、適切な数の空白を使う
set expandtab
" 自動インデントの各段階に使われる空白の数
set shiftwidth=4
" Tabキー押下時のカーソル移動幅
set softtabstop=4
" Tabの幅
set tabstop=4
" :set list コマンドでの表示に使われる文字
set listchars=tab:>-,extends:<,trail:-,eol:<
" 全角スペースを可視化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/
" Tab, Trailing Space などを強調表示
highlight EWS term=underline ctermbg=red guibg=red
match EWS /　\|\t\+\|\s\+$/
autocmd InsertEnter * match EWS /　\|\t\+\|\s\+\%#\@<!$/
autocmd InsertLeave * match EWS /　\|\t\+\|\s\+$/
autocmd BufWinLeave * call clearmatches()


"" FileFormat系設定
" ファイルフィーマット
set fileformat=unix
" 想定される改行の種類
set fileformats=unix,dos,mac


"" encoding系設定
" Vim 内部で使われる文字エンコーディング
set encoding=utf-8
" カレントバッファの文字エンコーディング
set fileencoding=utf-8
" 既存ファイルを編集するときに考慮される文字エンコーディング
set fileencodings=utf-8,iso-2022-jp,utf-16,ucs-2-internal,ucs-2,cp932,shift-jis,euc-jp,japan
" ターミナルで使われるエンコーディング
set termencoding=utf-8


"" 操作系設定
" Ctrl + カーソルキーでウィンドウ移動
map <C-Up> <C-W><Up>
map <C-Down> <C-W><Down>
map <C-Left> <C-W><Left>
map <C-Right> <C-W><Right>
" スペース / タブキーでウィンドウ移動
nnoremap <space> <C-w><C-w>
nnoremap <tab> <C-w><C-w>
" Ctrl + Shift + カーソルキーでタブ移動
map <C-S-Left> :tabp<CR>
map <C-S-Right> :tabn<CR>
" :new, :split などで新しいウィンドウを下に
set splitbelow
" :vnew, :vsplit などで新しいウィンドウを右に
set splitright
" 行が折り返されている場合、表示行で上/下に移動
nnoremap <C-k> gk
nnoremap <C-j> gj
" カーソル位置のファイルを別ウィンドウで編集
nnoremap gf <c-w>f
" 日時を入力するショートカット
inoremap <expr> ,df strftime("%Y-%m-%d (%a) %T")
inoremap <expr> ,dd strftime("%Y-%m-%d")
inoremap <expr> ,dt strftime("%T")
inoremap <expr> ,dw strftime("%Y-%m-%d (%a)")
inoremap <expr> ,dj strftime("%Y 年 %m 月 %d 日 (%a) %T")
" バックスペースキーの動作を決定する
set backspace=2


"" syntastic設定
let g:syntastic_check_on_open=0
let g:syntastic_check_on_save=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_loc_list=2
let g:syntastic_c_include_dirs = [ '../include', 'include', '/home/y/include', '/home/y/include64' ]
let g:syntastic_cpp_include_dirs = [ '../include', 'include', '/home/y/include', '/home/y/include64' ]
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [ 'javascript', 'php', 'perl' ],
                           \ 'passive_filetypes': [] }
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_javascript_jshint_conf = '~/.jshintrc'


"" Lint設定
" BufWrite 時に構文チェックを行う
"autocmd BufWritePost *.rb !ruby -c %
"autocmd BufWritePost *.pl !perl -wc %
"autocmd BufWritePost *.php !php -l %
" git設定
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=git
autocmd FileType git :set fileencoding=utf-8


"" その他設定
" Vi互換を無くす設定
set nocompatible
" コマンドをステータスラインに表示する
set showcmd
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" 新しい行を作ったときに高度な自動インデントを行う
set smartindent
" ウィンドウのタイトルを変更する設定
set title
" 補完候補を表示する
set wildmenu
" 補完動作の設定
set wildmode=list:full
" 保存時に行末の空白を除去する
"autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
"autocmd BufWritePre * :%s/\t/ /ge


"" vundle設定
filetype off
set rtp+=~/.vim/vundle.git
call vundle#rc()

" ツリー状にファイルやディレクトリの一覧を表示
Bundle 'vtreeexplorer'
" カーソルの下のURLを開くor単語を検索エンジンで検索
Bundle 'tyru/open-browser.vim'
" シンタックスチェック
Bundle 'syntastic'

filetype plugin indent on

" vtreeexplorerの設定
let g:treeExplVertical=1
let g:treeExplWinSize=25

" syntasticの設定
let g:syntastic_check_on_open=0
let g:syntastic_check_on_save=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_loc_list=2
let g:syntastic_c_include_dirs = [ '../include', 'include', '/home/y/include', '/home/y/include64' ]
let g:syntastic_cpp_include_dirs = [ '../include', 'include', '/home/y/include', '/home/y/include64' ]
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [ 'javascript', 'php', 'perl' ],
                           \ 'passive_filetypes': [] }
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_javascript_jshint_args = '--config ~/.jshintrc'
