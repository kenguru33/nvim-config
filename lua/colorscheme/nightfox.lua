-- Use a protected call so we don't error out on first use
local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
  return
end


nightfox.load('nightfox')

