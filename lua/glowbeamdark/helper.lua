local M = {}

function M.setup()
	local lush = require("lush")
	vim.cmd("autocmd BufWritePost * lua require('glowbeamdark.helper').compile()")
	lush.ify()
	vim.cmd("colorscheme glowbeamdark")
end

function M.compile()
	local glowbeamdark = require("lush").stringify(require("glowbeamdark"))
	local lines = vim.split(glowbeamdark, "\n")
	local sorted = table.slice(lines, 1, 3)
	local groups = table.slice(lines, 4)
	table.sort(groups, function (a, b) return a:lower() < b:lower() end)
	for _, group in ipairs(groups) do table.insert(sorted, group) end
	vim.fn.writefile(sorted, "colors/glowbeamdark.vim")
end

return M
