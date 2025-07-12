-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

function LookupKhronos(args)
  local arg = args["args"]
  local urlWithQuery = string.format("https://registry.khronos.org/OpenGL-Refpages/es3.0/html/%s.xhtml", arg)
  local command = string.format(":Browse %s", urlWithQuery)
  vim.cmd(command)
end

function BrowseKhronos()
  local urlWithQuery = "https://registry.khronos.org/OpenGL-Refpages/es3.0/"
  local command = string.format(":Browse %s", urlWithQuery)
  vim.cmd(command)
end

vim.api.nvim_create_user_command("LookupGLSL", LookupKhronos, { nargs = 1 })
vim.api.nvim_create_user_command("GLSLBrowse", BrowseKhronos, {})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "glsl",
  callback = function()
    vim.bo.keywordprg = ":LookupGLSL"
  end,
})

vim.filetype.add({
  extension = {
    frag = "glsl",
  },
})
