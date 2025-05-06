local ls = require("luasnip")
local s = ls.snippet
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
tex.in_text = function()
  return not tex.in_mathzone() and not tex.in_tikz()
end


return {

-- INLINE MATH
s({trig = "([^%l])mm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>$<>$<>",
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual),
      i(0)
    }
  ),
  { condition = tex.in_text }
),
-- INLINE MATH ON NEW LINE
s({trig = "^mm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "$<>$",
    {
      i(1),
    }
  )
),
-- INLINE MATH (environment)
s({trig = "([^%l])mm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>$<>$",
    {
      f( function(_, snip) return snip.captures[1] end ),
      i(0)
    }
  ),
  { condition = tex.in_text }
),
-- MINTINLINE: \mintinline
s({trig = "([^%l])mt", regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    [[
      <>\mintinline{<>}{<>}<>
    ]],
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual),
      i(2),
      i(0)
    }
  ),
  { condition = tex.in_text }
),
-- GENERIC ENVIRONMENT
s({trig="env", snippetType="autosnippet", dscr="A LaTeX environment"},
  fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
      <>
    ]],
    {
      i(1),
      i(2),
      rep(1),
      i(0),
    }
  ),
  { condition = line_begin }
),
-- ENVIRONMENT WITH ONE EXTRA ARGUMENT
s({trig="n2", snippetType="autosnippet"},
  fmta(
    [[
      \begin{<>}{<>}
          <>
      \end{<>}
    ]],
    {
      i(1),
      i(2),
      d(3, get_visual),
      rep(1),
    }
  ),
  { condition = line_begin }
),
-- ENVIRONMENT WITH TWO EXTRA ARGUMENTS
s({trig="n3", snippetType="autosnippet"},
  fmta(
    [[
      \begin{<>}{<>}{<>}
          <>
      \end{<>}
    ]],
    {
      i(1),
      i(2),
      i(3),
      d(4, get_visual),
      rep(1),
    }
  ),
  { condition = line_begin }
),
-- EQUATION
s({trig="eq", dscr="A LaTeX equation environment", snippetType="autosnippet"},
  fmta(
    [[
      \begin{equation}
          <>
      \end{equation}
    ]],
    { i(0) }
  ),
  { condition = line_begin }
),
-- UNNUMBERED EQUATION
s({trig="ueq", dscr="A LaTeX equation environment", snippetType="autosnippet"},
  fmta(
    [[
      \begin{equation*}
          <>
      \end{equation*}
    ]],
    { i(0) }
  ),
  { condition = line_begin }
),
-- ITEMIZE
s({trig="itt", snippetType="autosnippet"},
  fmta(
    [[
      \begin{itemize}
          \item <>
      \end{itemize}
    ]],
    {
      i(0),
    }
  ),
  {condition = line_begin}
),
-- ENUMERATE
s({trig="enn", snippetType="autosnippet"},
  fmta(
    [[
      \begin{enumerate}
          \item <>
      \end{enumerate}
    ]],
    {
      i(0),
    }
  )
),
-- FIGURE
s({trig = "fig", snippetType="autosnippet"},
  fmta(
    [[
      \begin{figure}[htb!]
          \centering
          \includegraphics[width=<>\linewidth]{<>}
          \caption{<>}
          \label{fig:<>}
      \end{figure}
    ]],
    {
      i(1),
      i(2),
      i(3),
      i(4),
    }
  ),
  { condition = line_begin }
),
-- TIKZ PICTURE
s({trig = "tik", snippetType="autosnippet"},
  fmta(
    [[
      \begin{tikzpicture}[<>]
          <>
      \end{tikzpicture}
      <>
    ]],
    {
      i(1),
      i(2),
      i(0)
    }
  ),
  { condition = line_begin }
),

}
