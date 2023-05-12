local cmd = vim.cmd
local global = vim.g
local opt = vim.opt

local options = {
	number = true,
	relativenumber = true,
	clipboard = { "unnamed", "unnamedplus" },
	mouse = "a",
	tabstop = 4,
	softtabstop = 4,
	expandtab = true,
	showtabline = 2,
	smartcase = true,
	smartindent = true,
	shiftwidth = 4,
	autoindent = true,
	hlsearch = true,
	ignorecase = true,
	showmatch = true,
	cursorline = true,
    cursorcolumn = true,
	termguicolors = true,
	undofile = true,
	timeoutlen = 100,
	swapfile = false,
	colorcolumn = "80",
}

for key, value in pairs(options) do
	opt[key] = value
end

-- Need to check if theme exist
local theme_ok, _ = pcall(cmd, "colorscheme ayu")
if theme_ok then
	global["ayucolor"] = "dark"
end

cmd("set whichwrap+=h,l,<,>,[,]")
cmd("syntax enable")
cmd("filetype plugin indent on")

-- Theme settings
local base_30 = {
  white = "#ced4df",
  darker_black = "#05080e",
  black = "#0B0E14", --  nvim bg
  black2 = "#14171d",
  one_bg = "#1c1f25",
  one_bg2 = "#24272d",
  one_bg3 = "#2b2e34",
  grey = "#33363c",
  grey_fg = "#3d4046",
  grey_fg2 = "#46494f",
  light_grey = "#54575d",
  red = "#F07178",
  baby_pink = "#ff949b",
  pink = "#ff8087",
  line = "#24272d", -- for lines like vertsplit
  green = "#AAD84C",
  vibrant_green = "#b9e75b",
  blue = "#36A3D9",
  nord_blue = "#43b0e6",
  yellow = "#E7C547",
  sun = "#f0df8a",
  purple = "#c79bf4",
  dark_purple = "#A37ACC",
  teal = "#74c5aa",
  orange = "#ffa455",
  cyan = "#95E6CB",
  statusline_bg = "#12151b",
  lightbg = "#24272d",
  pmenu_bg = "#ff9445",
  folder_bg = "#98a3af",
}

local base_16 = {
  base00 = "#0B0E14",
  base01 = "#1c1f25",
  base02 = "#24272d",
  base03 = "#2b2e34",
  base04 = "#33363c",
  base05 = "#c9c7be",
  base06 = "#E6E1CF",
  base07 = "#D9D7CE",
  base08 = "#c9c7be",
  base09 = "#FFEE99",
  base0A = "#56c3f9",
  base0B = "#AAD84C",
  base0C = "#FFB454",
  base0D = "#F07174",
  base0E = "#FFB454",
  base0F = "#CBA6F7",
}

cmd("hi Normal guibg=Black guifg=White")
cmd("hi @variable guibg=Black guifg=White")
cmd("hi @field guibg=Black guifg=White")
cmd("hi @type guifg=" .. base_16.base0A)
cmd("hi @variable.builtin guifg=" .. base_30.sun)
cmd("hi @keyword.function guifg=" .. base_30.orange)
cmd("hi @method.call guifg=" .. base_30.red)
cmd("hi @include guifg=" .. base_30.red)
cmd("hi @parameter guifg=" .. base_16.base0F)
cmd("hi @function guifg=" .. base_30.orange)
cmd("hi @parameter guifg=" .. base_16.base0F)
cmd("hi @constructor guifg=" .. base_16.base0A)
cmd("hi @tag.attribute guifg=" .. base_30.orange)
cmd("hi @tag.delimiter guifg=" .. base_30.cyan)
