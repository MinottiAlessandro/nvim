# User manual

## Git
| Keybinding | Description |
| ---------- | ----------- |
| \<leader\>gg | Opens Fugitives UI, here you can use the main git functionality|
| \<leader\>gc | List all the commits |
| \<leader\>gb | List all branches (you can also switch branch pressing enter on a specific branch) |
| \<leader\>gnb | Create a new branch from the current branch |
| \<leader\>gp | Git push |
| \<leader\>gr | Git pull (retrieve) |

When in the Fugitive UI you can:
    - 's' to stage a change
    - 'X' to discard change or commit
    - 'u' to unstage
    - 'U' to unsage all
    - 'cc' to create a commit (after inserting the commit message :wq to save and commit)
    - 'cz' to create a stash and include all staged/unstaged changes
    - 'cza' to apply ta last stash
    - 'cm' then specify the branch to merge into  the current branch

## File search & navigation
| Keybinding | Description |
| ---------- | ----------- |
| \<leader\>\<leader\> | Perform a global search |
| \<leader\>ff | Search a file with the specified name |
| \<leader\>fb | Search and open any active buffers |
| \<leader\>e | Open folder manager |
| \<leader\>u | Open undotree |
| ctrl e | Open Harpoon UI |
| <leader>a | Append a file to Harpoon |
| <leader>1,2,3,4 | Pick a buffer from Harpoon |
| <leader>r | Clear every buffer in Harpoon |
| <leader>d {insert number} | Delete a specific buffer from Harpoon |

## Text manipulation
| Keybinding | Description |
| ---------- | ----------- |
| > | Indent code (right) |
| < | Indent code (left)|
| gcc | Comment the current selection |

## Panes:
| Keybinding | Description |
| ---------- | ----------- |
| \<leader\>o | Open a new empty buffer |
| ' | Enlarge pane |
| " | Restrict pane |
| ctrl h,j,k,l | move the focus on another pane |
