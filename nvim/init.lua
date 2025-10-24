-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- clipboard(OSC52)
local ok, osc52 = pcall(require, "vim.ui.clipboard.osc52")
if ok then
  local function clean_paste(register)
    local content = osc52.paste(register)
    return function()
      local lines = content()
      for i, line in ipairs(lines) do
        lines[i] = line:gsub("\r", "") -- Remove ^M
      end
      return lines
    end
  end
  
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = osc52.copy("+"),
      ["*"] = osc52.copy("*"),
    },
    paste = {
      ["+"] = clean_paste("+"),
      ["*"] = clean_paste("*"),
    },
  }
end

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- load configs
require("config.lazy")
require("config.options")
require("config.mappings")
