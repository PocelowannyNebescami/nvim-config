return {
    'shortcuts/no-neck-pain.nvim',
    version = 'v2.*',
    opts = {
        autocmds = {
            enableOnVimEnter = 'safe',
        },
        buffers = {
            scratchPad = {
                enabled = true,
                location = '~/Documents/',
            },
            wo = {
                fillchars = 'eob: ',
            },
            bo = {
                filetype = 'md',
            },
        },
    },
}
