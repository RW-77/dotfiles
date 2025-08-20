local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmta = require("luasnip.extras.fmt").fmta

local helpers = require('caleb.util.luasnip-helpers')
local get_visual = helpers.get_visual
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local tex = {}
tex.in_tikz = function()
  local outer_env = vim.fn['vimtex#env#get_outer']()
  return outer_env.name == 'tikzpicture'
end
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

return {

s({trig="rec", snippetType="autosnippet"},
  fmta(
    [[
      \draw (<>,<>) rectangle (<>,<>);<>
    ]],
    {
      i(1),
      i(2),
      i(3),
      i(4),
      i(0)
    }
  ),
  { condition = tex.in_tikz and line_begin }
),
s({trig="cr", snippetType="autosnippet"},
  fmta(
    [[
      \draw (<>,<>) circle [radius=<>];<>
    ]],
    {
      i(1),
      i(2),
      i(3),
      i(0),
    }
  ),
  { condition = tex.in_tikz and line_begin }
),
s({trig="grd", snippetType="autosnippet"},
  fmta(
    [[
      \draw[step=<>,<>,<>] (<>,<>) grid (<>,<>);<>
    ]],
    {
      i(1),
      i(2),
      i(3),
      i(4),
      i(5),
      i(6),
      i(7),
      i(0)
    }
  ),
  { condition = tex.in_tikz and line_begin }
),
s({trig="arc", snippetType="autosnippet"},
  fmta(
    [[
      \draw (<>,<>) arc [start angle=<>, end angle=<>, radius=<>];<>
    ]],
    {
      i(1),
      i(2),
      i(3),
      i(4),
      i(5),
      i(0),
    }
  ),
  { condition = tex.in_tikz and line_begin }
),
s({trig="erc", snippetType="autosnippet"},
  fmta(
    [[
      \draw (<>,<>) arc [start angle=<>, end angle=<>, x radius=<>, y radius=<>];<>
    ]],
    {
      i(1),
      i(2),
      i(3),
      i(4),
      i(5),
      i(6),
      i(0),
    }
  ),
  { condition = tex.in_tikz and line_begin }
),
s({trig="pba", snippetType="autosnippet"},
  fmta(
    [[
      \draw (<>,<>) parabola (<>,<>);<>
    ]],
    {
      i(1),
      i(2),
      i(3),
      i(4),
      i(0)
    }
  ),
  { condition = tex.in_tikz and line_begin }
),

}
