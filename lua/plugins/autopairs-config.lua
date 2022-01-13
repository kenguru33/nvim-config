local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

-- put this to setup function and press <a-e> to use fast_wrap
npairs.setup({
	fast_wrap = {},
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
