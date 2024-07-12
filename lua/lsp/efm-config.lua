local status_ok, efmls = pcall(require, "efmls-configs")
if not status_ok then
  print "efmls-configs not installed"
  return
end

efmls.init {
  -- Your custom attach function
  on_attach = on_attach,

  -- Enable formatting provided by efm langserver
  init_options = {
    documentFormatting = true,
  },
}
