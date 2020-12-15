"========================预执行========================

"========================个人vim的配置========================

set nocompatible       " 与vi不兼容模式运行
let mapleader=" "      " 修改leader键,默认为“\”
let maplocalleader=',' " 设置local leader

set wrap               " 自动换行
set wildmenu           " 命令查找菜单
set clipboard=unnamed  " 默认粘贴到系统剪切板
set showcmd            " 显示输入的命令
set cursorline         " 当前行高亮
set number             " 行号
set relativenumber     " 相对行号
set helplang=cn        " 中文帮助文档
set encoding=utf-8     " utf-8编码
set fileencoding=utf-8 " 设置当前文件编码
set splitright         " 分屏时新窗口在右边
"set mouse=a           " 鼠标
"set t_Co=256          " 开启256色支持

"左侧的标志栏
if has("nvim")
  set signcolumn=yes
else
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
endif


" 搜索高亮相关设置
set hlsearch		"高亮搜索
set incsearch		"实时匹配
set ignorecase      "忽略大小写
set smartcase

" TAB 键
set expandtab                   "将Tab键转换为空格
set tabstop=4                   "设置Tab键的宽度
set shiftwidth=4                "换行时自动缩进宽度
set smarttab                    "指定按一次backspace就删除shiftwidth宽度(默认8个空格)

" 解决html着色误判断大于号(>)或小于号(<)导致的着色出错
autocmd FileType html   :syntax sync minlines=10000
"syntax sync minlines=10000
"syntax sync fromstart

"开启真彩色
if has('nvim')
        set termguicolors       
        if &term =~# '^screen'
            let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
            let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        endif
endif

" 设置空白字符的视觉提示
"set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:˽

" 显示不可见字符格式，set list打开，set nolist关闭
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"========================自定义按键映射========================
" 重新加载配置文件
nnoremap <leader>rc :source $MYVIMRC<CR>

" 取消搜索高亮
nnoremap <LEADER><CR> :nohlsearch<CR>

" 解决ctags默认跳转第一个项，也可用:ts
nnoremap <c-]> g<c-]>   

"开启/关闭NERDTree快捷键
nnoremap <F2> :NERDTreeToggle <CR>                    

" 函数列表
nnoremap <F3> :Vista!!<CR>

" 翻译
nnoremap <leader><F12> :TranslateW<CR>                    
xnoremap <leader><F12> :TranslateW<CR>                    

" FZF
"nnoremap <leader>f :FZF<CR>

" lazygit
nnoremap <leader>z :LazyGit<CR>

" floaterm
nnoremap <leader>t :FloatermNew<CR>

" ranger
nnoremap <leader>g :FloatermNew ranger<CR>

"========================vim-plug插件========================
call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'                           " 小奶牛
Plug 'kristijanhusak/vim-hybrid-material'           " hybrid配色方案
Plug 'psliwka/vim-smoothie'                         " 滚动优化
Plug 'tpope/vim-repeat'                             " 重复操作.优化
Plug 'andymass/vim-matchup'                         " 加强%
Plug 'sheerun/vim-polyglot'                         " 语法高亮
Plug 'airblade/vim-gitgutter'                       " vim中查看git状态
Plug 'luochen1990/rainbow'                          " 彩虹括号
Plug 'farmergreg/vim-lastplace'                     " 打开上次文件的位置
Plug 'voldikss/vim-translator'                      " 翻译
Plug 'gcmt/wildfire.vim'                            " 快速选择
Plug 'machakann/vim-sandwich'                       " 成对符号
Plug 'mg979/vim-visual-multi'                       " 多光标
"Plug 'tpope/vim-surround'                          " 解决括号成对的问题
"Plug 'ryanoasis/vim-devicons'                      " 图标

Plug 'vim-airline/vim-airline'                      " vim状态栏
Plug 'vim-airline/vim-airline-themes'               " vim状态栏主题

Plug 'itchyny/vim-cursorword'                       " 下划线
"Plug 'RRethy/vim-illuminate'                       " 高亮当前单词

"Plug 'lfv89/vim-interestingwords'                  " 单词高亮及跳转
Plug 'vim-scripts/Mark--Karkat'                     " 单词高亮及跳转
Plug 'preservim/nerdcommenter'                      " 注释
Plug 'MattesGroeger/vim-bookmarks'                  " 书签

Plug 'dhruvasagar/vim-table-mode'                   " 表格模式
Plug 'junegunn/vim-easy-align'                      " 符号对齐

Plug 'preservim/nerdtree'                           " 目录树
Plug 'liuchengxu/vista.vim'                         " 函数列表
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

"Plug 'vim-scripts/fcitx.vim'                       " fcitx输入法兼容

"Plug 'jiangmiao/auto-pairs'                        " 括号匹配
"Plug 'Raimondi/delimitMate'                        " 括号匹配

"Plug 'ludovicchabant/vim-gutentags'                " 自动打tag

"Plug 'vim-scripts/DoxygenToolkit.vim'              " 快速添加函数注释

"Plug 'vim-scripts/a.vim'                           " 头文件跳转


"Plug 'mattn/emmet-vim'                             " html语言扩展
Plug 'othree/html5.vim', {'for':['html']}

Plug 'pangloss/vim-javascript', {'for':['html', 'javascripe']}                      " js着色

Plug 'voldikss/vim-floaterm'                        " float termnial

" Clap, 模糊查询
"Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" ranger
"Plug 'francoiscabrol/ranger.vim'
"Plug 'rbgrouleff/bclose.vim'            

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'

" markdown
Plug 'godlygeek/tabular'                                                                    " 格式化代码
Plug 'plasticboy/vim-markdown',      {'for':['markdown']}                                   " 语法高亮
Plug 'mzlogin/vim-markdown-toc',     {'for':['markdown']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for':['markdown']  }

" snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" plantuml
"Plug 'scrooloose/vim-slumlord'
Plug 'tyru/open-browser.vim', {'for':['plantuml']}
Plug 'aklt/plantuml-syntax', {'for':['plantuml']}
Plug 'weirongxu/plantuml-previewer.vim', {'for':['plantuml']}


" 构建任务系统
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" clipper,粘贴板(remote)
"Plug 'wincent/vim-clipper'

if has('nvim')
        Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' } " 颜色值保存时显示颜色
        Plug 'neoclide/coc.nvim', {'branch': 'release'}           " coc补全
        Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' } " lazygit
endif

call plug#end()

"========================相关插件配置========================

" ===
" === vim-startify, 小奶牛
" ===
let g:startify_bookmarks = [ {'v': '~/.vimrc'}, {'z': '~/.zshrc'} ]

" ===
" === vim-hybrid-material, 配色方案
" ===
set background=dark
let g:enable_bold_font = 1                      "函数与语言控件等加粗
"let g:enable_italic_font = 1                    "注释为斜体
"let g:hybrid_transparent_background = 1         "透明背景
" 变量的设定都得需要在colorscheme之前才能生效
colorscheme hybrid_reverse
"let g:airline_theme = "hybrid"

" ===
" === airline, 状态栏
" ===
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#enabled=0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" ===
" ===vim_current_word
" ===
let g:vim_current_word#highlight_current_word = 0

" ===
" ===vim-interestingwords  单词高亮使用说明
" ===
" <leader> + k  高亮/取消高亮
" <leader> + K  取消所有高亮
" n,下一个高亮单词
" N,上一个高亮单词
"let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']

" ===
" ===NERDTree 目录树
" ===


" ===
" ===tagbar 函数列表
" ===
" <Ctrl> + w + <方向>, 切换窗口
" q,退出
" o,折叠/打开
" *,打开所有标签
" =,折叠所有标签
" x,展开/缩小tagbar
"map <F3> :TagbarToggle <CR>
"let g:tagbar_ctags_bin = 'ctags' 		"tagbar 依赖 ctags 插件
"let g:tagbar_width = 30 			    "设置 tagbar 的宽度为 30 列，默认 40 列
"let g:tagbar_sort = 0                   "关闭排序
"let g:tagbar_autopreview = 1            "自动预览
"let g:tagbar_autofocus = 1 			    "打开 tagbar 时,光标在 tagbar 页面内

" ===
" ===vista.vim 函数列表
" ===
" q 退出
" p 预览
" s 排序

" ===
" ===nerdcommenter 注释
" ===
" 数字+<leader>+快捷键
" cc,进行注释选中的行
" cu,进行取消注释
" ca,切换注释的方式
" cs,以”性感”的方式注释
" cm,块注释 cA,在当前行尾添加注释符，并进入Insert模式
" c$,从光标开始到行尾注释


" ===
" ===fcitx.vim
" ===
" 在离开或重新进入插入模式时自动记录和恢复每个缓冲区各自的输入法状态，以便在普通模式下始终是英文输入模式，切换回插入模式时恢复离开前的输入法输入模式。
"set ttimeoutlen=100                     "终端下请设置 Vim 'ttimeoutlen' 选项为较小值（如100），否则退出插入模式时会有较严重的延迟。同样会造成延迟的还有 screen 的 maptimeout 选项以及 tmux 的 escape-time 选项。

" ===
" ===emmet-vim
" ===
" :h emmet      帮助文档

" ===
" ===auto-pairs
" ===
"let g:AutoPairs = {',':' ','(':')', '[':']', '{':'\}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"} 
"let g:AutoPairs['<'] = '>'

" ===
" ===vim-gitgutter
" ===
" jump to next hunk (change),跳到下个改动区域: ]c
" jump to previous hunk (change),跳到上个改动区域: [c
" preview the hunk,光标所在的区域的预览改动: <Leader>hp
" stage the hunk,光标所在的区域的暂存改动: <Leader>hs
" undo it,光标所在的区域的撤销改动: <Leader>hu
" 改动行高亮显示打开：GitGutterLineHighlightsEnable
" 改动行高亮显示关闭：GitGutterLineHighlightsDisable
" 改动行高亮显示切换：GitGutterLineHighlightsToggle
" 改动标志显示打开：GitGutterSignsEnable
" 改动标志显示关闭：GitGutterSignsDisable
" 改动标志显示切换：GitGutterSignsToggle
" 折叠/打开折叠：GitGutterFold
set updatetime=100                  "显示的延迟，默认为4000即4s，这里设置为100ms，这个值同时控制写入swap文件的时间
let g:gitgutter_max_signs = -1      "default value,超过多少改动将不显示改动符号，-1为不设置上限

" ===
" ===vim-easy-align
" ===
" -表示倒数第几个符号, 默认为1, 如-2<space>, 倒数第二个空格
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ===
" ===vim-gutentags
" ===
"" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
"let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
"
"" 所生成的数据文件的名称 "
"let g:gutentags_ctags_tagfile = '.tags'
"
"" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
"let s:vim_tags = expand('~/.cache/tags')
"let g:gutentags_cache_dir = s:vim_tags
"" 检测 ~/.cache/tags 不存在就新建 "
"if !isdirectory(s:vim_tags)
"   silent! call mkdir(s:vim_tags, 'p')
"endif
"
"" 配置 ctags 的参数 "
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


" 参数详解
" c   类(classes)
" d   宏定义(macro definitions)
" e   枚举变量(enumerators)
" f   函数定义(function definitions)
" g   枚举类型(enumeration names)
" l   局部变量(local variables)，默认不提取
" m   类、结构体、联合体(class, struct, and union members)
" n   命名空间(namespaces)
" p   函数原型(function prototypes)，默认不提取
" s   结构体类型(structure names)
" t   (typedefs)
" u   联合体类型(union names)
" v   变量定义(variable definitions)
" x   外部变量(external and forward variable declarations)，默认不提取


" ===
" === rainbow
" ===
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['Silver', 'IndianRed', 'darkcyan', 'gray' , 'RoyalBlue3', 'mediumpurple'],
\	'ctermfgs': ['gray', 'brown', 'lightblue', 'lightyellow', 'darkgreen', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {},
\		'css': 0,
\	}
\}

" ===
" ===DoxygenToolkit.vim
" ===
"let g:DoxygenToolkit_blockHeader  = "************************************************************"
"let g:DoxygenToolkit_briefTag_pre = "@Brief: "
"let g:DoxygenToolkit_paramTag_pre = "@Param: "
"let g:DoxygenToolkit_returnTag    = "@Returns: "
"let g:DoxygenToolkit_versionTag    = "@Version: "
"let g:DoxygenToolkit_versionString = "1.0"
"let g:DoxygenToolkit_authorTag    = "@Author: "
"let g:DoxygenToolkit_authorName   = "HIDE"
"let g:DoxygenToolkit_dateTag      = "@Date: "
"let g:DoxygenToolkit_blockFooter  = "************************************************************"
""let g:DoxygenToolkit_briefTag_funcName = "yes"  " 显示函数名称
""let g:DoxygenToolkit_commentType = "C++"
"let g:DoxygenToolkit_compactDoc = "no"   " 单行模式
"let g:Doxygen_enhanced_color = 1
"
"" 快捷键
"nnoremap fcb :Dox<cr>
"nnoremap fcv :DoxAuthor<cr>

" ===
" ===a.vim
" ===
":A switches to the header file corresponding to the current file being edited (or vise versa)
":AS splits and switches
":AV vertical splits and switches
":AT new tab and switches
":AN cycles through matches
":IH    跳转到光标下的文件
":IHS   水平分屏并切换到光标所在的文件
":IHV   垂直分屏并切换到光标所在的文件
":IHT new tab and switches
":IHN cycles through matches
"<Leader>ih switches to file under cursor
"<Leader>is switches to the alternate file of file under cursor (e.g. on  <foo.h> switches to foo.cpp)
"<Leader>ihn cycles through matches

" ===
" === lazygit.vim
" ===
" setup mapping to call :LazyGit
"nnoremap <silent> <leader>lg :LazyGit<CR>



" ===
" === coc.nvim
" ===
" TextEdit might fail if hidden is not set.
if has('nvim')
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.手动触发补全
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the
" cursor.高亮引用，不完全不是很好用
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList, coclist的按键映射
" Show all diagnostics.显示所有诊断
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.管理扩展
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.显示命令
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.寻找当前文件的符号
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.寻找工作区的符号
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.恢复最后一次打开的coclist
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
endif

" ===
" === vim-surround
" ===
" cs <被修改的符号> <修改后的符号>
" ds <需要删除的符号> 
" ysiw <单词中需要添加的符号>
" yss <一行需要添加的符号>
" 选中后S <需要添加的符号>


" ===
" ===vim-hexokinase
" ===
"let g:Hexokinase_highlighters = ['virtual']
let g:Hexokinase_highlighters = ['foreground']

" ===
" === vim-markdown
" ===
" zr：降低整个缓冲区的折叠级别,默认折叠所有标题，降低一级则打开一级标题内容
" zm：增加整个缓冲区的折叠级别
" zR：打开所有折叠
" zM：折叠所有内容
" za：打开光标所在的折叠
" zc：关闭光标所在的折痕
" zA：递归打开一个折痕
" zC：递归关闭折痕
"
" MarkdownPreview 打开预览
"let g:vim_markdown_folding_style_pythonic = 1
let g:vmt_cycle_list_item_markers = 1           "改变目录级别显示
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" ===
" === vim-table-mode
" ===
" <Leader>tm :打开table模式


" ===
" === ranger
" ===
"let g:ranger_map_keys = 0
"let g:NERDTreeHijackNetrw = 0
"let g:ranger_replace_netrw = 1 "vim打开目录文件时，运行ranger

" ===
" === neosnippet.vim
" ===
"
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" ===
" === vim-matchup
" ===
let g:matchup_matchparen_offscreen = {'scrolloff': '1'}

" ===
" === vim-floaterm
" ===

" ===
" === asynctasks.vim
" ===
let g:asyncrun_open = 6 "告诉 asyncrun 运行时自动打开高度为 6 的 quickfix 窗口，不然你看不到任何输出，除非你自己手动用 :copen 打开它

" ===
" === tmux
" ===
" 让tmux的颜色跟随vim-airline一起变化
" https://github.com/edkolev/tmuxline.vim/issues/24

"function! AddTmuxlineStatus()
"  if exists(':Tmuxline')
"    augroup airline_tmuxline
"      au!
"      au InsertEnter * call SetInsert()
"      autocmd InsertLeave * call SetNormal()
"      vnoremap <silent> <expr> <SID>SetVisual SetVisual()
"      nnoremap <silent> <script> v v<SID>SetVisual
"      nnoremap <silent> <script> V V<SID>SetVisual
"      nnoremap <silent> <script> <C-v> <C-v><SID>SetVisual
"      autocmd CursorHold * call SetNormal()
"    augroup END
"  endif
"endfunction
"function! SetInsert()
"    Tmuxline airline_insert
"endfunction
"function! SetVisual()
"    set updatetime=0
"    Tmuxline airline_visual
"    return ''
"endfunction
"function! SetNormal()
"    set updatetime=4000
"    Tmuxline airline
"endfunction
"au VimEnter * :call AddTmuxlineStatus()

" ===
" === vim-clipper
" ===
"let g:ClipperAuto=1

" ===
" === vim-bookmarks
" ===

" 禁用原来的所有按键映射
let g:bookmark_no_default_key_mappings = 1
nmap mm <Plug>BookmarkToggle
" 给bookmark做注释
nmap mi <Plug>BookmarkAnnotate
" 显示所有bookmark
nmap ma <Plug>BookmarkShowAll
nmap mj <Plug>BookmarkNext
nmap mk <Plug>BookmarkPrev
" 清除当前buffer的所有bookmark
nmap mc <Plug>BookmarkClear
" 清除所有buffer的所有bookmark
nmap mx <Plug>BookmarkClearAll
"|-----------------------------------------------+------------+-----------------------------|
"| Action                                        | Shortcut   | Command                     |
"|-----------------------------------------------+------------+-----------------------------|
"| Add/remove bookmark at current line           | mm         | :BookmarkToggle             |
"| Add/edit/remove annotation at current line    | mi         | :BookmarkAnnotate <TEXT>    |
"| Jump to next bookmark in buffer               | mn         | :BookmarkNext               |
"| Jump to previous bookmark in buffer           | mp         | :BookmarkPrev               |
"| Show all bookmarks (toggle)                   | ma         | :BookmarkShowAll            |
"| Clear bookmarks in current buffer only        | mc         | :BookmarkClear              |
"| Clear bookmarks in all buffers                | mx         | :BookmarkClearAll           |
"| Move up bookmark at current line              | [count]mkk | :BookmarkMoveUp [<COUNT>]   |
"| Move down bookmark at current line            | [count]mjj | :BookmarkMoveDown [<COUNT>] |
"| Move bookmark at current line to another line | [count]mg  | :BookmarkMoveToLine <LINE>  |
"| Save all bookmarks to a file                  |            | :BookmarkSave <FILE_PATH>   |
"| Load bookmarks from a file                    |            | :BookmarkLoad <FILE_PATH>   |
"|-----------------------------------------------+------------+-----------------------------|

" ===
" === vim-translator, 翻译
" ===

" ===
" === fzf
" ===
" <enter>, 当前窗口打开
" <c-t>, 新tabs打开
" <c-x>, 相当于spilt
" <c-v>, 相当于vspilt

" ===
" === vim-sandwich
" ===
" sa{motion/textobject}{addition}, 增加
" sdb or sd{deletion}, 删除
" srb{addition} or sr{deletion}{addition}, 替换

" ===
" ===vim-visual-multi
" ===
"Basic usage:
"
"select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
"create cursors vertically with Ctrl-Down/Ctrl-Up
"select one character at a time with Shift-Arrows
"press n/N to get next/previous occurrence
"press [/] to select next/previous cursor
"press q to skip current and get next occurrence
"press Q to remove current cursor/selection
"start insert mode with i,a,I,A
"
"Two main modes:
"
"in cursor mode commands work as they would in normal mode
"in extend mode commands work as they would in visual mode
"press Tab to switch between «cursor» and «extend» mode


" ===
" === LeaderF
" ===
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

"========================其他配置========================
"##### auto fcitx5  ###########
"fcitx5-remote -o, 激活输入法
"fcitx5-remote -c, 取消激活输入法,即回到英文输入
"默认进入插入模式时为英文
function! Fcitx2en()
   let s:input_status = system("fcitx5-remote")
   if s:input_status == 2
      let l:a = system("fcitx5-remote -c")
   endif
endfunction

"终端下请设置 Vim 'ttimeoutlen' 选项为较小值（如100），否则退出插入模式时会有较严重的延迟。同样会造成延迟的还有 screen 的 maptimeout 选项以及 tmux 的 escape-time 选项。
set ttimeoutlen=100
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"##### auto fcitx end ######

"========================开启指定服务========================
syntax enable                   "开启语法检查
filetype plugin on              "文件类型检查
highlight clear SignColumn      "让signcolumn与行号一个颜色
"取消搜索高亮
exec "nohlsearch"
