-- writing old-style vim-script commands, because Startify doesn't seem to have a lua interface?
-- it cannot be loaded life other plugins, with pcall

vim.cmd [[
    let g:startify_session_persistence = 1
    let g:startify_files_number = 20
]]
