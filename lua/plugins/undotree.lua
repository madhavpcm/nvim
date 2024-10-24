local status_ok, undotree = pcall(require, "undotree")

if not status_ok then
  print "undotree not installed"
  return
end
