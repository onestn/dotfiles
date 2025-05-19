return {
  "goolord/alpha-nvim",
  config = function ()
    local alpha = require'alpha'
    local dashboard = require'alpha.themes.dashboard'
    dashboard.section.header.val = {
      [[                                                    ]],
      [[                                                    ]],
      [[                                                    ]],
      [[                                                    ]],
      [[                                                    ]],
      [[                                                    ]],
      [[          ██  ████████  ██                          ]],
      [[          ████████████████                          ]],
      [[          ██████████████████                        ]],
      [[        ████  ████  ██████████                      ]],
      [[        ████████████████████████                    ]],
      [[        ██████    ██████████████████     ONE STONE  ]],
      [[        ██  ██  ████  ████████████████████████████  ]],
      [[        ████        ████████████████████████        ]],
      [[        ████████████████████████████████████        ]],
      [[        ████████████████████████████████████        ]],
      [[        ████████████████████████████████████        ]],
      [[        ████████████████████████████████████        ]],
      [[        ██████████████████████████████████          ]],
      [[          ████████████████████████████████          ]],
      [[          ████    ████        ████    ████          ]],
      [[          ████    ████        ████    ████          ]],
      [[          ██      ██          ██      ██            ]],
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
    local handle = io.popen('fortune')
    local fortune = handle:read("*a")
    handle:close()

    dashboard.section.footer.val = fortune
    dashboard.config.opts.noautocmd = true

    vim.cmd[[autocmd User AlphaReady echo 'ready']]

    alpha.setup(dashboard.config)
  end
}
