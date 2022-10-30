# gh-status.nvim

Dead-simple plugin to update your GitHub profile status from Vim.

## Installation

This depends on [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) to make HTTP request, please install it if you haven't.

Using [vim-plug](https://github.com/junegunn/vim-plug):

```bash
Plug 'duydang2311/gh-status.nvim'
```

## Setup

```lua
local gh_status = require'gh-status'

gh_status.setup({
	username = '<username>',
	token = '<access_token>'
})
```

## Use

As for now, you have to manually invoke the function to update your status.

You can, e.g. either map `changeUserStatus` to a key to set your status,
or combine it with autocmd.

```lua
local gh_status = require'gh-status'

vim.keymap.set('n', '<leader>gh', function()
	gh_status.changeUserStatus('editing ' .. vim.fn.expand('%:t'))
end, { noremap = true, silent = false })
```

![image](https://user-images.githubusercontent.com/34796192/198901059-03f03c95-489d-43a1-91e7-ee231bbd77cf.png)


