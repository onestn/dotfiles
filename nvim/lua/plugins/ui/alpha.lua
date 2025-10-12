return {
  "goolord/alpha-nvim",
  lazy = false,
  config = function ()
    local alpha = require'alpha'
    local dashboard = require'alpha.themes.dashboard'
    dashboard.section.header.val = {
      [[										                                                            ]],
      [[										                                                            ]],
      [[										                                                            ]],
      [[										                                                            ]],
      [[                                             __                                 ]],
      [[                                            /\ \__                              ]],
      [[    ___     ___       __              ____  \ \ ,_\    ___     ___       __     ]],
      [[   / __`\ /' _ `\   /'__`\  _______  /',__\  \ \ \/   / __`\ /' _ `\   /'__`\   ]],
      [[  /\ \L\ \/\ \/\ \ /\  __/ /\______\/\__, `\  \ \ \_ /\ \L\ \/\ \/\ \ /\  __/   ]],
      [[  \ \____/\ \_\ \_\\ \____\\/______/\/\____/   \ \__\\ \____/\ \_\ \_\\ \____\  ]],
      [[   \/___/  \/_/\/_/ \/____/          \/___/     \/__/ \/___/  \/_/\/_/ \/____/  ]],
      [[										                                                            ]],
      [[										                                                            ]],
      [[										                                                            ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "1  Find file", ":Telescope find_files <CR>"),
      dashboard.button("e", "2  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("p", "3  Find project", ":Telescope projects <CR>"),
      dashboard.button("r", "4  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "5  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "6  Configuration", ":e $MYVIMRC<CR>"),
      dashboard.button("q", "7  Quit Neovim", ":qa<CR>"),
    }
    dashboard.config.opts.noautocmd = true

    vim.cmd[[autocmd User AlphaReady echo 'ready']]

    alpha.setup(dashboard.config)
  end
}
