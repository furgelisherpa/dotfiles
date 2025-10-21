local status_ok, copilot = pcall(require, "CopilotChat")
if not status_ok then
	return
end

copilot.setup({
	auto_insert_mode = true, -- Enter insert mode when opening
	auto_fold = true, -- Automatically folds non-assistant messages
})

vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
