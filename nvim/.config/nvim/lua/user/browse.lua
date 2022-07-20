local status_ok, browse = pcall(require, "browse")
if not status_ok then
  return
end

browse.setup {
  provider = "duckduckgo",
}

local bookmarks = {
  "https://github.com/christianchiarulli",
  "https://doc.rust-lang.org/book/",
  "https://aur.archlinux.org/packages/",
  "https://news.ycombinator.com/",
}

local function command(name, rhs, opts)
  opts = opts or {}
  vim.api.nvim_create_user_command(name, rhs, opts)
end

command("BrowseInputSearch", function()
  browse.input_search()
end, {})

command("Browse", function()
  browse.browse { bookmarks = bookmarks }
end, {})

command("BrowseBookmarks", function()
  browse.open_bookmarks { bookmarks = bookmarks }
end, {})

command("BrowseDevdocsSearch", function()
  browse.devdocs.search()
end, {})

command("BrowseDevdocsFiletypeSearch", function()
  browse.devdocs.search_with_filetype()
end, {})

command("BrowseMdnSearch", function()
  browse.mdn.search()
end, {})

