local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  print "dashboard not found"
  return
end

local home = os.getenv "HOME"

db.dashboard_default_executive = "telescope"

db.custom_header = {
  [[ ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓]],
  [[ ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒]],
  [[▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░]],
  [[▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ]],
  [[▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒]],
  [[░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░]],
  [[░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░]],
  [[   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ]],
  [[         ░    ░  ░    ░ ░        ░   ░         ░   ]],
  [[                                ░                  ]],
}

db.setup {
  theme = "hyper",
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      { desc = " Update", group = "@property", action = "Lazy update", key = "u" },
      {
        desc = " Files",
        group = "Label",
        action = "Telescope find_files",
        key = "SPC f f",
      },
      {
        desc = " Apps",
        group = "DiagnosticHint",
        action = "Telescope app",
        key = "a",
      },
      {
        desc = " dotfiles",
        group = "Number",
        action = "Telescope dotfiles",
        key = "d",
      },
    },
  },
}
