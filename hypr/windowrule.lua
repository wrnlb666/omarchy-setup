-- Keep only your personal window, workspace, and device rules here.
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Use the scrolling layout for the scratchpad workspace.
hl.workspace_rule({ workspace = "special:scratchpad", layout = "scrolling" })

-- Open selected desktop applications as centered floating windows.
local apps = {
	-- { name = "QQ-spawn", match = { initial_class = "^(QQ)$" } },
	-- { name = "QQ", match = { initial_title = "^(QQ)$" }, size = { 1200, 800 } },
	-- { name = "wechat-weixin", match = { initial_title = "^(Weixin)$" }, size = { 1200, 800 } },
	{
		name = "wechat",
		match = { initial_class = "^(wechat)$", initial_title = "^(Weixin|微信)$" },
		float = false,
	},
	{
		name = "wechat-float",
		match = { initial_class = "^(wechat)$", initial_title = "negative:^(Weixin|微信)$" },
		float = true,
		center = false,
		border_size = 0,
	},
	{
		name = "codex-pet",
		match = {
			initial_class = "^chatgpt$",
			float = true,
		},
		border_size = 0,
		pin = true,
	},
	{ name = "Bitwarden", match = { initial_class = "^(Bitwarden)$" }, size = { 1200, 800 } },
	{ name = "localsend", match = { initial_title = "^(LocalSend)$" }, size = { 800, 600 } },
	{ name = "AmneziaVPN", match = { initial_class = "^(AmneziaVPN)$" }, size = { 400, 800 } },
	{ name = "Boxes", match = { initial_class = "^(org.gnome.Boxes)$" }, size = { 1200, 800 } },
	{ name = "Mattermost", match = { initial_class = "^(Mattermost.Desktop)$" }, size = { 1200, 800 } },
	{
		name = "pamac",
		match = { initial_class = "^(org.manjaro.pamac.manager)$" },
		size = { 1200, 800 },
		float = true,
	},
}

for _, app in ipairs(apps) do
	local should_float = app.float ~= false
	hl.window_rule({
		name = app.name,
		match = app.match,
		size = app.size,
		float = should_float and true or nil,
		tile = not should_float and true or nil,
		center = should_float and (app.center ~= false) or nil,
		border_size = app.border_size,
		pin = app.pin,
	})
end

hl.window_rule({ match = { class = "^(Bitwarden)$" }, tag = "-floating-window" })
