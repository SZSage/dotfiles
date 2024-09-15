return {
  {
    'luk400/vim-jukit',
    enabled = true,
    keys = {
      nnoremap = {
        ['<leader>z'] = ':call jukit#send#section(0)<cr>'
      }
    }
  }
}

