local api = vim.api
local utils = require('dashboard.utils')

local function week_ascii_text()
  return {
    ['Monday'] = {
      '',
      '███╗   ███╗ ██████╗ ███╗   ██╗██████╗  █████╗ ██╗   ██╗',
      '████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝',
      '██╔████╔██║██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ',
      '██║╚██╔╝██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ',
      '██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ',
      '╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ',
      '',
    },
    ['Tuesday'] = {
      '',
      '████████╗██╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗',
      '╚══██╔══╝██║   ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝',
      '   ██║   ██║   ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ ',
      '   ██║   ██║   ██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  ',
      '   ██║   ╚██████╔╝███████╗███████║██████╔╝██║  ██║   ██║   ',
      '   ╚═╝    ╚═════╝ ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ',
      '',
    },
    ['Wednesday'] = {
      '',
      '██╗    ██╗███████╗██████╗ ███╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗',
      '██║    ██║██╔════╝██╔══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝',
      '██║ █╗ ██║█████╗  ██║  ██║██╔██╗ ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ ',
      '██║███╗██║██╔══╝  ██║  ██║██║╚██╗██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  ',
      '╚███╔███╔╝███████╗██████╔╝██║ ╚████║███████╗███████║██████╔╝██║  ██║   ██║   ',
      ' ╚══╝╚══╝ ╚══════╝╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ',
      '',
    },
    ['Thursday'] = {
      '',
      '████████╗██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗  █████╗ ██╗   ██╗',
      '╚══██╔══╝██║  ██║██║   ██║██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝',
      '   ██║   ███████║██║   ██║██████╔╝███████╗██║  ██║███████║ ╚████╔╝ ',
      '   ██║   ██╔══██║██║   ██║██╔══██╗╚════██║██║  ██║██╔══██║  ╚██╔╝  ',
      '   ██║   ██║  ██║╚██████╔╝██║  ██║███████║██████╔╝██║  ██║   ██║   ',
      '   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ',
      '',
    },
    ['Friday'] = {
      '',
      '███████╗██████╗ ██╗██████╗  █████╗ ██╗   ██╗',
      '██╔════╝██╔══██╗██║██╔══██╗██╔══██╗╚██╗ ██╔╝',
      '█████╗  ██████╔╝██║██║  ██║███████║ ╚████╔╝ ',
      '██╔══╝  ██╔══██╗██║██║  ██║██╔══██║  ╚██╔╝  ',
      '██║     ██║  ██║██║██████╔╝██║  ██║   ██║   ',
      '╚═╝     ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ',
      '',
    },
    ['Saturday'] = {
      '',
      '███████╗ █████╗ ████████╗██╗   ██╗██████╗ ██████╗  █████╗ ██╗   ██╗',
      '██╔════╝██╔══██╗╚══██╔══╝██║   ██║██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝',
      '███████╗███████║   ██║   ██║   ██║██████╔╝██║  ██║███████║ ╚████╔╝ ',
      '╚════██║██╔══██║   ██║   ██║   ██║██╔══██╗██║  ██║██╔══██║  ╚██╔╝  ',
      '███████║██║  ██║   ██║   ╚██████╔╝██║  ██║██████╔╝██║  ██║   ██║   ',
      '╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ',
      '',
    },
    ['Sunday'] = {
      '',
      '███████╗██╗   ██╗███╗   ██╗██████╗  █████╗ ██╗   ██╗',
      '██╔════╝██║   ██║████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝',
      '███████╗██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ',
      '╚════██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ',
      '███████║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ',
      '╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ',
      '',
    },
  }
end

local function default_header()
  return {
    '',
    ' ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗  █████╗ ██████╗ ██████╗  ',
    ' ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔═══██╗██╔══██╗██╔══██╗██╔══██╗ ',
    ' ██║  ██║███████║███████╗███████║██████╔╝██║   ██║███████║██████╔╝██║  ██║ ',
    ' ██║  ██║██╔══██║╚════██║██╔══██║██╔══██╗██║   ██║██╔══██║██╔══██╗██║  ██║ ',
    ' ██████╔╝██║  ██║███████║██║  ██║██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝ ',
    ' ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  ',
    '',
  }
end

local function week_header(concat, append)
  local week = week_ascii_text()
  local daysoftheweek =
    { 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' }
  local day = daysoftheweek[os.date('*t').wday]
  local tbl = week[day]
  table.insert(tbl, os.date('%Y-%m-%d %H:%M:%S ') .. (concat or ''))
  if append then
    vim.list_extend(tbl, append)
  end
  table.insert(tbl, '')
  return tbl
end

local function generate_header(config)
  if not vim.bo[config.bufnr].modifiable then
    vim.bo[config.bufnr].modifiable = true
  end
  if not config.command then
    local header = config.week_header
        and config.week_header.enable
        and week_header(config.week_header.concat, config.week_header.append)
      or (config.header or default_header())
    api.nvim_buf_set_lines(config.bufnr, 0, -1, false, utils.center_align(header))

    for i, _ in ipairs(header) do
      vim.api.nvim_buf_add_highlight(config.bufnr, 0, 'DashboardHeader', i - 1, 0, -1)
    end
    return
  end

  local empty_table_height = config.file_height + 4
  if config.padding_bottom then
    empty_table_height = config.file_height + config.row + config.padding_bottom
  end
  local empty_table = utils.generate_empty_table(empty_table_height)
  api.nvim_buf_set_lines(config.bufnr, 0, -1, false, utils.center_align(empty_table))
  local preview = require('dashboard.preview')
  preview:open_preview({
    row = config.row or math.floor(config.file_height / 5),
    col = config.col or math.floor((vim.o.columns - config.file_width) / 2),
    width = config.file_width,
    height = config.file_height,
    cmd = config.command .. ' ' .. config.file_path,
  })
end

return {
  generate_header = generate_header,
}
