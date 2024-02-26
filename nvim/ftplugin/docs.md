# 1. Filetypes
---
Vim can detect the type of file that is edited.
This is done by checking the file name and sometimes by inspecting the contents of the file for specific text.

To enable file type detection, use this comand in your vimrc:
`:filetype on`

Each time a new or existing file is edited, Vim will try to recognize the type of the file and set the 'filetype' option.
This will trigger the FileType event, which can be used to set the syntax highlighting, set options, etc.
