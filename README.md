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

You can, e.g. either map `changeUserStatus` to a key to set the status message to your current editing file,
or combine it with autocmd.

```lua
local gh_status = require'gh-status'

vim.keymap.set('n', '<leader>gh', function()
	gh_status.changeUserStatus('editing ' .. vim.fn.expand('%:t'))
end, { noremap = true, silent = false })
```

