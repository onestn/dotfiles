return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  opts = {
    options = {
      component_separators = "|",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_c = {
        {
          "filename",
          path = 1,
          shorting_target = 40
        }
      },
      lualine_x = { "filetype" },
      lualine_z = { "location" },
    }
  }
}
