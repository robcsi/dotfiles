local status_ok, startify = pcall(require, "startify")
if not status_ok then
  return
end

vim.g.startify_session_persistence = 1
