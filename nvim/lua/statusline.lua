local gl = require('galaxyline')
local gls = gl.section

local colors = {
  bg = '#1c2023',
  fg = '#eaebed',
  section_bg = '#1c2023',

  white = '#eeeeee',
  yellow = '#fac863',
  cyan = '#62b3b2',
  green = '#99c794',
  orange = '#f99157',
  magenta = '#c594c5',
  blue = '#0087ff',
  red = '#ec5f67'
}

function is_buffer_empty()
  return vim.fn.empty(vim.fn.expand('%:t')) == 1
end

local buffer_not_empty = function()
  return not is_buffer_empty()
end

local function file_readonly()
  if vim.bo.filetype == 'help' then return '' end
  if vim.bo.readonly == true then return " " end

  return ''
end

function string:split(delimiter)
  local result = { }
  local from  = 1
  local delim_from, delim_to = string.find( self, delimiter, from  )
  while delim_from do
    table.insert( result, string.sub( self, from , delim_from-1 ) )
    from  = delim_to + 1
    delim_from, delim_to = string.find( self, delimiter, from  )
  end
  table.insert( result, string.sub( self, from  ) )
  return result
end

local modeColor = function()
  local modeColors = {
    n = colors.blue,
    i = colors.red,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
    t = colors.yellow,
    no = colors.cyan,
    s = colors.green,
    S = colors.green,
    ic = colors.yellow,
    r = colors.yellow,
    Rv = colors.yellow,
    rm = colors.yellow,
    ['r?'] = colors.yellow,
    ['!'] = colors.yellow
  }

  return modeColors[vim.fn.mode()]
end

local get_current_file_path = function()
  local file = vim.fn.expand('%:t')
  local path = vim.fn.expand('%:p:h')
  local git_dir = require('galaxyline.provider_vcs').get_git_dir(path)
  local home = os.getenv("HOME")

  if git_dir == nil and string.match(path, home) then
    path = "~" .. string.gsub(path, home, "")
  end

  if git_dir ~= nil then
    local del_table = string.split(git_dir, "/")
    local len = table.maxn(del_table)

    del_table[len] = nil
    del_table[len - 1] = nil

    local del_str = table.concat(del_table, "/") .. "/"
    path = string.gsub(path, del_str, "")
  end

  if vim.fn.empty(file) == 1 then return '' end

  if string.len(file_readonly()) ~= 0 then
    return path .. "/" .. file .. file_readonly()
  end

  if vim.bo.modifiable then
    if vim.bo.modified then
      return path .. "/" .. file .. '  '
    end
  end

  return path .. "/" .. file .. ' '
end

-- -- Left side
gls.left[1] = {
  ViMode = {
    provider = function()
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'VISUAL',
        [''] = 'VISUAL',
        v ='VISUAL',
        ic  = 'COMMAND-LINE',
        ['r?'] = ':CONFIRM',
        rm = '--MORE',
        R  = 'REPLACE',
        Rv = 'VIRTUAL',
        s  = 'SELECT',
        S  = 'SELECT',
        ['r']  = 'HIT-ENTER',
        [''] = 'SELECT',
        t  = 'TERMINAL',
        ['!']  = 'SHELL',
      }

      vim.api.nvim_command('hi GalaxyViMode guibg=' .. modeColor())

      return '  ' .. alias[vim.fn.mode()] .. ' '
    end,
    highlight = { colors.white, colors.bg, 'bold' },
    separator = "\u{E0B0} ",
    separator_highlight = {
      function()
        return modeColor()
      end,
      colors.section_bg,
    },
  },
}

gls.left[2] = {
  FileName = {
    provider = get_current_file_path,
    condition = buffer_not_empty,
    highlight = { colors.fg, colors.section_bg },
    separator = " ",
    separator_highlight = {colors.section_bg, colors.bg},
  }
}

gls.left[3] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = { colors.green, colors.bg },
  }
}

gls.left[4] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = { colors.orange, colors.bg },
  }
}

gls.left[5] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = { colors.red,colors.bg },
  }
}

gls.left[6] = {
  CocStatus = {
    provider = CocStatus,
    highlight = {colors.green,colors.bg},
    icon = '  🗱'
  }
}

-- Right side
gls.right[1] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = ' ',
    highlight = {colors.red,colors.section_bg}
  }
}

gls.right[2] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = 'ﰣ ',
    separator = ' ',
    separator_highlight = {colors.fg, colors.section_bg},
    highlight = {colors.orange,colors.section_bg},
  }
}

gls.right[3] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = ' ',
    highlight = {colors.blue,colors.section_bg},
    separator = ' ',
    separator_highlight = {colors.fg, colors.section_bg},
  }
}

gls.right[4] = {
  FileFormat = {
    provider = function() return vim.bo.filetype end,
    highlight = { colors.fg,colors.section_bg },
    separator = ' ',
    separator_highlight = {colors.fg, colors.section_bg},
  }
}
gls.right[5] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
    separator = ' ',
    separator_highlight = {colors.fg, colors.section_bg},
  },
}

gls.right[6] = {
  ScrollBar = {
    provider = function()
      return vim.api.nvim_eval('LineNoIndicator()')
    end,
    highlight = { colors.fg, colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.bg, colors.section_bg },
  },
}

gls.right[7] = {
  FinalSpacing = {
    provider = function()
      return ' '
    end,
    highlight = { colors.fg, colors.section_bg },
  },
}

-- Short line

gls.short_line_left[1] = {
  BufferIcon = {
    provider= 'FileName',
    highlight = { colors.fg, colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.bg },
  }
}
gls.short_line_right[1] = {
  BufferType = {
    provider = function() return vim.bo.filetype end,
    highlight = { colors.fg, colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.bg },
  }
}

gls.short_line_right[2] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
    separator = ' ',
    separator_highlight = {colors.fg, colors.section_bg},
  },
}

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()
