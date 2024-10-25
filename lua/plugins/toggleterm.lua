local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  print "toggleterm not found"
  return
end

toggleterm.setup {}
