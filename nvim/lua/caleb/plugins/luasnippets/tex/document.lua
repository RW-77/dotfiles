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
  local is_inside = vim.fn['vimtex#env#is_inside']('tikzpicture')
  return (is_inside[1] > 0 and is_inside[2] > 0)
end
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end


return {

-- DOCUMENTCLASS: \documentclass[]{}
s({trig="dcc", snippetType="autosnippet"},
  fmta(
    [=[
      \documentclass[<>]{<>}
    ]=],
    {
      i(1, "letterpaper"),
      i(2, "article"),
    }
  ),
  { condition = line_begin }
),
-- USE LATEX Package: \usepackage{}
s({trig="pack", snippetType="autosnippet"},
  fmta(
    [[
      \usepackage{<>}
    ]],
    {
      d(1, get_visual),
    }
  ),
  { condition = line_begin }
),
-- NEW COMMAND: \newcommand{}{}
s({trig="nc"},
  fmta(
    [[
      \newcommand{<>}{<>}
    ]],
    {
      i(1),
      i(2)
    }
  ),
  { condition = line_begin }
),
-- SECTION: \section{}
s({trig="h1", snippetType="autosnippet"},
  fmta(
    [[
      \section{<>}
    ]],
    {
      d(1, get_visual),
    }
  )
),
-- SUBSECTION: \subsection{}
s({trig="h2", snippetType="autosnippet"},
  fmta(
    [[
      \subsection{<>}
    ]],
    {
      d(1, get_visual),
    }
  )
),
-- SUBSUBSECTION: \subsubsection{}
s({trig="h3", snippetType="autosnippet"},
  fmta(
    [[
      \subsubsection{<>}
    ]],
    {
      d(1, get_visual),
    }
  )
),
-- LABEL: \label
s({trig="lbl", snippetType="autosnippet"},
  fmta(
    [[
      \label{<>}
    ]],
    {
      d(1, get_visual),
    }
  )
),
-- HSPACE: \hspace
s({trig="hss", snippetType="autosnippet"},
  fmta(
    [[
      \hspace{<>}
    ]],
    {
      d(1, get_visual),
    }
  )
),
-- VSPACE: \vspace
s({trig="vss", snippetType="autosnippet"},
  fmta(
    [[
      \vspace{<>}
    ]],
    {
      d(1, get_visual),
    }
  )
),
-- URL 
s({trig="url"},
  fmta(
    [[
      \url{<>}
    ]],
    {
      d(1, get_visual),
    }
  )
),
-- PARENTHESIS
s({trig="(", wordTrig = false, snippetType="autosnippet"},
  {
    t("("),
    d(1, get_visual),
    t(")"),
    i(0),
  },
  { condition = tex.in_text }
),
-- CURLY BRACES
s({trig="{", wordTrig = false, snippetType="autosnippet"},
  {
    t("{"),
    d(1, get_visual),
    t("}"),
    i(0),
  },
  { condition = tex.in_text }
),
-- SQUARE BRACKETS
s({trig="[", wordTrig = false, snippetType="autosnippet"},
  {
    t("["),
    d(1, get_visual),
    t("]"),
    i(0),
  },
  { condition = tex.in_text }
),


}
