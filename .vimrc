" Creating a vimrc to make your life easy and making vim a progromming in itself. 

" Comments are inserted into this file with a " character. 

" ################################################################

" Many parameters for vim are created using the set command. 

" Set numbering for your vim text file. 
:set nu

" To remove numbering, do 
" :set nonu 

" Set highlighting for a search.
:set hlsearch

" Automatically takes the cursor to the next match found.
:set incsearch

" Set the wildmenu, which is useful for autocompletion. This displays a menu when you press <TAB>
" Press more <TAB>'s to see more options. 

:set wildmenu
:set wildmode=list:longest,full

" Set the scrolloff : This determines how many lines should be at least visible above or below the cursor,
" to determine when to start the scrolling.

:set scrolloff=5

" ################################################################

" Useful for programmers to automatically perform indentation for various languages to present
" a better looking code. smartindent is one such option. The good thing I like about it is, it
" learns the ways you comment for future indentations.
:set smartindent

" Other options you could try : 
":set autoindent

" Decide how your tabbing should happen : 
" shiftwidth decides by how much units your line is shifted when you press << or >>.
" The unit is definied by 
:set shiftwidth=2
" Fill in the indents with spaces instead of TAB's.
:set softtabstop=2

" Go to http://vim.wikia.com/wiki/Indenting_source_code for more details.

" ################################################################


" Allow mouse interaction in vim. This is useful when moving the cursor quickly to 
" an exact point, or highlighting text using a mouse (for copy/paste) which is numbered. 
:set mouse=a

" Extending the mouse model. If you are still not comfortable with keyboard control,
" this mode allows you to do some cool stuff with mouse. For example,
" Shift+left click on a word to search for its next instance. 
:set mousemodel=extend

" ################################################################
" Mapping keys as macros : 
" The format is map <input_key> <mapping_command>

:map <F2> :echo 'Current time is ' . strftime('%c')<CR>
:map <F9> :make %< <CR>

" More information on mappings can be found at : http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_%28Part_1%29

" ################################################################

" Abbreviations, as form of macros for longer sentences. Type #d <SPACE> to autocomplete #define. 
:ab #d #define
:ab #i #include
:ab #l Long live revolution

" To remove all abbreviations, use : 
" :abclear

" ################################################################

" You can specify commands to be executed automatically when reading or writing
" a file, when entering or leaving a buffer or window, and when exiting Vim.
" This is done by the autocmd command (abbreviated as au).

" BufReadPost : When starting to edit a new buffer, after reading the file into the buffer, before executing the modelines, BufReadPost contains the state of the buffer. 
" This would determine where the last line of the file is, using $, and where the location of the current line is when the file was last closed, using the '" character. 

" The exe command does the execution of the command provided as argument. 
" normal! indicates execute in the normal mode, by clearing any mappings when executing. This is done, because
" a user may define his own mapping during the execution, and that might screw up the command. 
" The command tells vim to go to the line marked '" if it was within the limits of first and last line.

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" More information on autocmd and BufReadPost can be found at : http://vimdoc.sourceforge.net/htmldoc/autocmd.html.
