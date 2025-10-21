local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local function cbuffers()
	return function()
		local bufs = vim.api.nvim_list_bufs()
		local output = {}
		local current_buf = vim.api.nvim_get_current_buf()

		for _, buf in ipairs(bufs) do
			if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
				local name = vim.api.nvim_buf_get_name(buf)
				name = name ~= "" and vim.fn.fnamemodify(name, ":t") or "[No Name]"
				if buf == current_buf then
					name = "*" .. name
				end
				if vim.bo[buf].modified then
					name = name .. "[+]"
				end
				table.insert(output, name)
			end
		end
		return table.concat(output, " | ")
	end
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = { "NvimTree" },
			winbar = {},
		},
		ignore_focus = { "NvimTree" },
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16,
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"Filetype",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
			},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			cbuffers(),
		},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
