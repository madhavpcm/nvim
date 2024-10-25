local status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  print "nvim-autopairs not found"
  return
end

nvim_autopairs.setup {
  map_cr = true,
  check_ts = true,
}
