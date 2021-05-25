--
-- Vimspector
--

-- Layout
vim.api.nvim_exec(
[[
function! CustomiseUI()
  " Close the output window
  call win_gotoid( g:vimspector_session_windows.output )
  q
  call win_gotoid( g:vimspector_session_windows.stack_trace )
  q
endfunction

augroup MyVimspectorUICustomistaion
  autocmd!
  autocmd User VimspectorUICreated call CustomiseUI()
augroup END
]],
false
)

vim.g.vimspector_sidebar_width = 75
vim.g.vimspector_sign_priority = {
    vimspectorBP = 999,
    vimspectorBPCond = 999,
    vimspectorBPDisabled = 999,
    vimspectorPC = 999,
}

-- Keybinds
vim.api.nvim_set_keymap("n", "<leader>dd",
    "<Plug>VimspectorToggleBreakpoint<CR>",
    {}
)
vim.api.nvim_set_keymap("n", "<leader>dn",
    "<Plug>VimspectorContinue<CR>",
    {}
)
vim.api.nvim_set_keymap("n", "<leader>df",
    "<Plug>VimspectorStepInto<CR>",
    {}
)
vim.api.nvim_set_keymap("n", "<leader>dq",
    "<Plug>VimspectorStop<CR>",
    {}
)
vim.api.nvim_set_keymap("n", "<leader>do",
    "<Plug>VimspectorStepOver<CR>",
    {}
)
vim.api.nvim_set_keymap("n", "<leader>dh",
    "<Plug>VimspectorRunToCursor<CR>",
    {}
)
vim.api.nvim_set_keymap("n", "<leader>dr",
    ":VimspectorReset<CR>",
    {}
)
vim.api.nvim_set_keymap("n", "<leader>di",
    "<Plug>VimspectorBalloonEval<CR>",
    {}
)
