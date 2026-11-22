-- Atalhos pessoais (migrados do Arch: ALT como tecla principal).
-- Gerenciado pelo chezmoi (perfil omarchy). Defaults do Omarchy (SUPER) continuam valendo.

-- Apps
o.bind("ALT + T", "Terminal", o.launch_terminal())
o.bind("ALT + B", "Browser", { omarchy = "browser" })
o.bind("ALT + E", "File manager", { omarchy = "nautilus" })

-- Janela
o.bind("ALT + Q", "Close window", hl.dsp.window.close())
o.bind("ALT + F", "Full screen", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
o.bind("ALT + P", "Toggle floating", hl.dsp.window.float({ action = "toggle" }))
o.bind("ALT + R", "Toggle window split", hl.dsp.layout("togglesplit"))

-- Foco e troca de janelas (vim keys)
local dirs = { H = "l", L = "r", K = "u", J = "d" }
for key, dir in pairs(dirs) do
  o.bind("ALT + " .. key, "Focus " .. dir, hl.dsp.focus({ direction = dir }))
  o.bind("ALT + SHIFT + " .. key, "Swap window " .. dir, hl.dsp.window.swap({ direction = dir }))
end

-- Areas de trabalho: ALT + 1..0 navega, ALT + SHIFT + 1..0 move a janela
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  o.bind("ALT + " .. key, "Switch to workspace " .. workspace, o.workspaces.focus(workspace))
  o.bind("ALT + SHIFT + " .. key, "Move window to workspace " .. workspace, o.workspaces.move_window(workspace))
end

-- Scratchpad
o.bind("ALT + S", "Toggle scratchpad", hl.dsp.workspace.toggle_special("scratchpad"))
o.bind("ALT + SHIFT + S", "Move window to scratchpad", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

-- Mouse
o.bind("ALT + mouse_down", "Next workspace", hl.dsp.focus({ workspace = "m+1" }))
o.bind("ALT + mouse_up", "Previous workspace", hl.dsp.focus({ workspace = "m-1" }))
o.bind("ALT + mouse:272", "Move window", hl.dsp.window.drag(), { mouse = true })
o.bind("ALT + mouse:273", "Resize window", hl.dsp.window.resize(), { mouse = true })
