local M = {}

function M.get_servers()
  local config_path = vim.fn.stdpath("config")
  local pattern = config_path .. "/lsp/*.lua"
  local files = vim.split(vim.fn.glob(pattern), "\n", { trimempty = true })

  local servers = {}
  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ":t:r")
    table.insert(servers, name)
  end

  return servers
end

return M
