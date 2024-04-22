local mapkeyret = require("utils.mapkey").mapkeyret

return {
    "aserowy/tmux.nvim",
    lazy = false,
    config = function()
        return require("tmux").setup({
            resize = { enable_default_keybindings = false },
        })
    end,
    keys = {
        mapkeyret("C-A-h", "lua require('tmux').resize_left()", "Resize TMUX pane to the left"),
        mapkeyret("C-A-j", "lua require('tmux').resize_bottom()", "Resize TMUX pane to the bottom"),
        mapkeyret("C-A-k", "lua require('tmux').resize_top()", "Resize TMUX pane to the top"),
        mapkeyret("C-A-l", "lua require('tmux').resize_right()", "Resize TMUX pane to the right"),
    },
}
