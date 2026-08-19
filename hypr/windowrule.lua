-- Keep only your personal window, workspace, and device rules here.
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Use the scrolling layout for the scratchpad workspace.
hl.workspace_rule({ workspace = "special:scratchpad", layout = "scrolling" })

-- Open selected desktop applications as centered floating windows.
local floating_apps = {
	{ name = "QQ", match = { initial_title = "^(QQ)$" }, size = { 1200, 800 } },
	{ name = "wechat-weixin", match = { initial_title = "^(Weixin)$" }, size = { 1200, 800 } },
	{ name = "wechat-wechat", match = { initial_title = "^(WeChat)$" }, size = { 1200, 800 } },
	{ name = "Bitwarden", match = { initial_class = "^(Bitwarden)$" }, size = { 1200, 800 } },
	{ name = "localsend", match = { initial_title = "^(LocalSend)$" }, size = { 800, 600 } },
	{ name = "AmneziaVPN", match = { initial_class = "^(AmneziaVPN)$" }, size = { 400, 800 } },
	{ name = "Boxes", match = { initial_class = "^(org.gnome.Boxes)$" }, size = { 1200, 800 } },
	{ name = "Mattermost", match = { initial_class = "^(Mattermost.Desktop)$" }, size = { 1200, 800 } },
	{
		name = "pamac",
		match = { initial_class = "^(org.manjaro.pamac.manager)$" },
		size = { 1200, 800 },
	},
}

for _, app in ipairs(floating_apps) do
	hl.window_rule({ name = app.name, match = app.match, float = true, center = true, size = app.size })
end

hl.window_rule({ match = { initial_class = "^(QQ)$" }, float = true, center = true })
hl.window_rule({ match = { initial_class = "^(wechat)$" }, float = true, center = true })
hl.window_rule({ match = { class = "^(Bitwarden)$" }, tag = "-floating-window" })
