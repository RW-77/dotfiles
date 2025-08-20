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
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end


return {

-- TYPEWRITER: \texttt{}
s({trig="tt", dscr="Expands 'tt' into '\texttt{}'", snippetType="autosnippet"},
  fmta(
    "\\texttt{<>}",
    {
      i(1)
    }
  ),
  { condition = tex.in_text  }
),
-- (VISUAL) TYPEWRITER: \texttt{}
s({trig="tt", dscr="Expands 'tt' into '\texttt{}'"},
  fmta(
    "\\texttt{<>}",
    {
      d(1, get_visual)
    }
  )
),
-- ITALIC: \textit{}
s({trig="tii", dscr="Expands 'tt' into '\texttt{}'", snippetType="autosnippet"},
  fmta(
    "\\textit{<>}",
    {
      i(1)
    }
  )
),
-- (VISUAL) ITALIC: \textit{}
--[[
s({trig = "tii", wordTrig=false, snippetType="autosnippet", dscr = "Expands 'tii' into LaTeX's textit{} command."},
  fmta("\\textit{<>}",
    {
      d(1, get_visual)
    }
  )
),
]]

-- italic visual test
s({trig="tii", wordTrig = false, snippetType="autosnippet"},
  {
    t("\\textit{"),
    d(1, get_visual),
    t("}"),
  }
),
-- BOLD: \textbf{}
s({trig="tbb", dscr="Expands 'tbb' into '\textbf{}'", snippetType="autosnippet"},
  fmta(
    "\\textbf{<>}",
    {
      i(1)
    }
  )
),
-- (VISUAL) BOLD: \textbf{}
s({trig = "tbb", dscr = "Expands 'tbb' into LaTeX's textbf{} command."},
  fmta(
    "\\textbf{<>}",
    {
    d(1, get_visual)
    }
  )
),

-- text within math
s({trig = "([^%l])tm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
        "<>\\text{<>}",
        {
            f( function(_, snip) return snip.captures[1] end ),
            d(1, get_visual),
        }
    ),
    { condition = tex.in_mathzone }
),

-- SI: \SI{}{}
s({trig="sii", dscr="Expands 'tbb' into '\textbf{}'", snippetType="autosnippet"},
  fmta(
    "\\SI{<>}{<>}<>",
    {
      i(1),
      i(2),
      i(0)
    }
  )
),
-- \kilo\ohm
s({trig = "kohm", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  {
    t("\\kilo\\ohm"),
  },
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a")}
),
-- \kilo\ohm
s({trig = "pll", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  {
    t("\\mathbin{\\|}"),

  },
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),

}
