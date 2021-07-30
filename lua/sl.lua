local gl = require('galaxyline')
local condition = require('galaxyline.condition')

-- disable for these file types
-- echo &ft
gl.short_line_list = { 'startify', 'nerdtree', 'term', 'fugitive', 'NvimTree', 'dapui_scopes', 'dapui_stacks' }

-- onedark
local colors = {
  bg = '#282c34',
  bg_dim = '#333842',
  bg_light = '#444b59',
  black = '#222222',
  white = '#abb2bf',
  gray = '#868c96',
  red = '#e06c75',
  green = '#98c379',
  yellow = '#e5c07b',
  blue = '#61afef',
  purple = '#7c7cff', -- tweaked to match custom color
  teal = '#56b6c2',
}

local function mode_alias(m)
  local alias = {
    n = 'NORMAL',
    i = 'INSERT',
    c = 'COMMAND',
    R = 'REPLACE',
    t = 'TERMINAL',
    [''] = 'V-BLOCK',
    V = 'V-LINE',
    v = 'VISUAL',
  }

  return alias[m] or ''
end

local function mode_color(m)
  local mode_colors = {
    normal =  colors.green,
    insert =  colors.blue,
    visual =  colors.purple,
    replace =  colors.red,
  }

  local color = {
    n = mode_colors.normal,
    i = mode_colors.insert,
    c = mode_colors.replace,
    R = mode_colors.replace,
    t = mode_colors.insert,
    [''] = mode_colors.visual,
    V = mode_colors.visual,
    v = mode_colors.visual,
  }

  return color[m] or colors.bg_light
end


gl.section.left[1] = {
  ViModeIcon = {
    separator = '  ',
    separator_highlight = {colors.black, colors.bg_light},
    highlight = {colors.white, colors.black},
    provider = function() return "   " end,
  }
}

gl.section.left[2] = {
  CWD = {
    separator = '  ',
    separator_highlight = function()
      return {colors.bg_light, condition.buffer_not_empty() and colors.bg_dim or colors.bg}
    end,
    highlight = {colors.white, colors.bg_light},
    provider = function()
      local dirname = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
      return ' ' .. dirname .. ' '
    end,
  }
}

gl.section.left[3] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {colors.gray, colors.bg_dim},
  }
}

gl.section.left[4] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.gray, colors.bg_dim},
    separator_highlight = {colors.bg_dim, colors.bg},
    separator = '  ',
  }
}

gl.section.left[5] = {
  DiffAdd = {
    icon = '  ',
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    highlight = {colors.white, colors.bg},
  }
}

gl.section.left[6] = {
  DiffModified = {
    icon = '  ',
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    highlight = {colors.gray, colors.bg},
  }
}

gl.section.left[7] = {
  DiffRemove = {
    icon = '  ',
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    highlight = {colors.gray, colors.bg},
  }
}

gl.section.left[8] = {
  CocStatus = {
    provider = 'GetLspClient',
    highlight = {colors.gray, colors.bg},
  }
}

gl.section.left[9] = {
  DebugStatus = {
    icon = 'λ ',
    highlight = {colors.gray, colors.bg},
    provider = function()
      return require'dap'.status()
    end,
  }
}

-- Right
gl.section.right[1] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = ' ✘ ',
    highlight = {colors.red,colors.bg}
  }
}
gl.section.right[2] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}

gl.section.right[3] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.purple,colors.bg},
  }
}

gl.section.right[4] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}


gl.section.right[5] = {
  GitBranch = {
    icon = ' ',
    separator = '  ',
    separator_highlight = {colors.bg_dim, colors.bg},
    condition = condition.check_git_workspace,
    highlight = {colors.teal, colors.bg},
    provider = 'GitBranch',
  }
}

gl.section.right[6] = {
  FileLocation = {
    icon = ' ',
    separator = ' ',
    separator_highlight = {colors.bg_dim, colors.bg},
    highlight = {colors.gray, colors.bg_dim},
    provider = function()
      local current_line = vim.fn.line('.')
      local total_lines = vim.fn.line('$')

      if current_line == 1 then
        return 'Top'
      elseif current_line == total_lines then
        return 'Bot'
      end

      local percent, _ = math.modf((current_line / total_lines) * 100)
      return '' .. percent .. '%'
    end,
  }
}

vim.api.nvim_command('hi GalaxyViModeReverse guibg=' .. colors.bg_dim)

gl.section.right[7] = {
  ViMode = {
    icon = ' ',
    separator = ' ',
    separator_highlight = 'GalaxyViModeReverse',
    highlight = {colors.bg, mode_color()},
    provider = function()
      local m = vim.fn.mode() or vim.fn.visualmode()
      local mode = mode_alias(m)
      local color = mode_color(m)
      vim.api.nvim_command('hi GalaxyViMode guibg=' .. color)
      vim.api.nvim_command('hi GalaxyViModeReverse guifg=' .. color)
      return ' ' .. mode .. ' '
    end,
  }
}

gl.section.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gl.section.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gl.section.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}
