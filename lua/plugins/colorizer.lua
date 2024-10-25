local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  print "colorizer not found"
  return
end

colorizer.setup {
  "*", -- Highlight all files, but customize some others.
  css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
  html = { names = false },
}
