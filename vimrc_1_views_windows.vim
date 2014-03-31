" This tutorial discusses the commonly useful functions to control your vim
" views and multiple windows within the same vim session.

" Folding your functions : 
" In long files of code, you sometimes want to not see all the code in a file at
" a time, because its coming in the way of navigating efficiently through your
" code. You can "fold" some of the code between two braces by using the zfa}
" command. If you wish to fold a peice of code enclosed by two braces, you need
" to place your cursor between the { and }. It folds the innermost block you are
" at. Let's map this to a Function key. 

:nmap <F4> zfa}

" You can fold a code block when you are at the } brace of that particular block
" zf%. 

" Sometimes it is good to fold the block with the next occuring }. You can do it 
" as follows :

"Let's break the below command down : 
" 1. Search for the next occuring } using the "/}<CR>" command and take your
"    cursor there. (<CR> stands for Enter)
" 2. Do a zf% to fold the block. 
" 3. Do a nohlsearch to undo the effect of your /} command that highlights all
"    the }'s. 

:nmap <F5> /}<CR>zf%<ESC>:nohlsearch<CR>

" Oh, and you can remove all folds using the zE command.
:nmap <F6> zE<CR>

" ################################################################

" Setting and loading views. 
" We have already discussed how we can reload the last edited view of a file
" using certain commands. We can similarly save certain views of your file to be
" reopened later using the mkview and loadview commands. 
" The mkview stores the current position of the cursor along with any folds you
" had created earlier, in the $HOME/.vim/view directory. Make sure you create
" $HOME/.vim folder before you use the following commands/mappings.

" An extensive description of folding can be found at : 
" http://vimdoc.sourceforge.net/htmldoc/fold.html

:nmap <F7> <ESC>:mkview<CR>
:nmap <F8> <ESC>:loadview<CR>

" A few extra options : 
" You can invoke the mkview and loadview using a number (0-9) as an argument.
" This allows you to create multiple view states for a file. Take a look at
" how these views are stored in the .vim/view directory. 

" To automatically save the views at exit and load the views upon opening, use
" the au command using the rules described in Chapter 0.

:au BufWinLeave * mkview
:au BufWinEnter * silent loadview

" ################################################################

" Managing multiple windows in .vimrc.
" Usually, a new file can be opened in a split window using the :split (horizontal split)
" or a :vsplit (vertical split) command. When you open a new window, you need to determine
" how the split happens. Should the newly opened window be opened while minimizing the
" already existing windows? I usually prefer it that way. This automatically focuses on
" on the newly opened file. To do so, 

" Always open any file with a large number of lines :
:set winheight=9999
" You can set the winheight to a suitable number for deciding the number of
" lines a new window is opened into upon split. 

" However, you still want to resize the windows now and again. You can resize using the 
" mappings <Ctrl-W>+ and <Crtl-W>-. These increase/decrease the size by one line respectively.
" You can have additional mappings to do this faster : 

: nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
: nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Let's break down these two mappings : 
" 1. nnoremap is a mapping which does a non-recursive mapping in the normal mode (n + nore + map)
" 2. The <silent> precondition tells vim to not display any messages when executing the forthcoming
"    key sequence. 
" 3. The <Leader> translates to the value of the "mapleader" variable. If the mapleader variable is
"    not set, It is replaced by \. Therefore, the above two mappings are defined for the sequence 
"    \+ and \-. 
" 4. The resize command is executed for that mapping. The arguments provided to the resize command
"     are (3/2 * current window size) and (2/3 * current window size) respectively.

" Window switching : We do simple mappings to allow easy switching between tiled windows. 

" Move to the window below
: nnoremap <C-J> <C-W><C-J>

" Move to the window above
: nnoremap <C-K> <C-W><C-K>

" Move to the window on the right
: nnoremap <C-L> <C-W><C-L>

"Move to the window on the left
: nnoremap <C-H> <C-W><C-H>

" There are a lot more windows manipulation commands that you can find at : 
" http://vimdoc.sourceforge.net/htmldoc/windows.html

" ################################################################

" Always display the status line, even if one window is open
: set laststatus=2
