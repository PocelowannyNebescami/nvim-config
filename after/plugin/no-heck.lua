require("no-neck-pain").setup({
    autocmds = {
        enableOnVimEnter = 'safe',
    },
    buffers = {
        scratchPad = {
            enabled = true,
            location = "~/Documents/",
        },
        wo = {
            fillchars = "eob: ",
        },
        bo = {
            filetype = "md"
        },
    },
})
