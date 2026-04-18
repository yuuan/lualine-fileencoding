-- Copyright (c) 2020-2021 hoob3rt, shadmansaleh
-- MIT license, see LICENSE for more details.
local lualine_require = require('lualine_require')
local M = lualine_require.require('lualine.component'):extend()

local default_options = {
  show_bomb = false, -- Show '[BOM]' when the file has a byte-order mark
  symbols = {
    unix = '', -- e712
    dos = '', -- e70f
    mac = '', -- e711
  },
}

function M:init(options)
  M.super.init(self, options)
  self.options = vim.tbl_deep_extend('keep', self.options or {}, default_options)
end

function M:update_status()
  local format = vim.bo.fileformat
  local format_str
  if self.options.icons_enabled then
    format_str = self.options.symbols[format] or format
  else
    format_str = format
  end

  local encoding = vim.opt.fileencoding:get()

  local result = format_str .. ' ' .. encoding

  if self.options.show_bomb and vim.opt.bomb:get() then
    result = result .. ' [BOM]'
  end

  return result
end

return M
