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

--[[
-- BASIC
]]--

-- Paired parentheses
s({trig="(", wordTrig = false, snippetType="autosnippet"},
  {
    t("("),
    d(1, get_visual),
    t(")"),
  }
),

--[[
-- GREEK LETTERS
]]--

s({trig=";a", snippetType="autosnippet"},
  { t("\\alpha") }, { condition = tex.in_mathzone }
),
s({trig=";b", snippetType="autosnippet"},
  { t("\\beta") }, { condition = tex.in_mathzone }
),
s({trig=";g", snippetType="autosnippet"},
  { t("\\gamma") }, { condition = tex.in_mathzone }
),
s({trig=";t", snippetType="autosnippet"},
  { t("\\theta") }, { condition = tex.in_mathzone }
),
s({trig=";d", snippetType="autosnippet"},
  { t("\\delta") }, { condition = tex.in_mathzone }
),
s({trig=";e", snippetType="autosnippet"},
  { t("\\epsilon") }, { condition = tex.in_mathzone }
),
s({trig=";u", snippetType="autosnippet"},
  { t("\\mu") }, { condition = tex.in_mathzone }
),
s({trig=";d", snippetType="autosnippet"},
  { t("\\delta") }, { condition = tex.in_mathzone }
),
s({trig=";d", snippetType="autosnippet"},
  { t("\\delta") }, { condition = tex.in_mathzone }
),
s({trig=";d", snippetType="autosnippet"},
  { t("\\delta") }, { condition = tex.in_mathzone }
),

--[[
-- COMMON EXPRESSIONS
]]--

-- SUPERSCRIPT
s({trig = "([%w%)%]%}])'", wordTrig=false, regTrig = true, snippetType="autosnippet"},
  fmta(
    "<>^{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual),
    }
  ),
  {condition = tex.in_mathzone}
),
-- SUBSCRIPT
s({trig = "([%w%)%]%}]);", wordTrig=false, regTrig = true, snippetType="autosnippet"},
  fmta(
    "<>_{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual),
    }
  ),
  {condition = tex.in_mathzone}
),
-- SUBSCRIPT AND SUPERSCRIPT
s({trig = "([%w%)%]%}])__", wordTrig=false, regTrig = true, snippetType="autosnippet"},
  fmta(
    "<>_{<>}^{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      i(1),
      i(2),
    }
  ),
  {condition = tex.in_mathzone}
),
-- SUPERSCRIPT WITH PARENTHESIS
s({trig = "([%w%)%]%}])ml", wordTrig=false, regTrig = true, snippetType="autosnippet"},
  fmta(
    "<>^{(<>)}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual),
    }
  ),
  {condition = tex.in_mathzone}
),
-- SUBSCRIPT WITH PARENTHESIS
s({trig = "([%w%)%]%}])nl", wordTrig=false, regTrig = true, snippetType="autosnippet"},
  fmta(
    "<>_{(<>)}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual),
    }
  ),
  {condition = tex.in_mathzone}
),
-- HAT
s({trig = "([^%a])hh", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  fmta(
    [[
       <>\hat{<>}
    ]],
    {
      f( function(_, snip) return snip.captures[1] end ),
      i(1),
    }
  ),
  { condition = tex.in_mathzone }
),

--[[
-- INLINE MATH TEXT
--]]

-- NORMAL MATH TEXT
s({trig = "([^%a])tt", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  fmta(
    [[
       <>\text{<>}<>
    ]],
    {
      f( function(_, snip) return snip.captures[1] end ),
      i(1),
      i(0)
    }
  ),
  { condition = tex.in_mathzone }
),

-- BOLD MATH TEXT
s({trig = "([^%a])bf", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  fmta(
    [[
       <>\mathbf{<>}
    ]],
    {
      f( function(_, snip) return snip.captures[1] end ),
      i(1),
    }
  ),
  { condition = tex.in_mathzone }
),

--[[
-- MATH CONSTRUCTS
--]]

-- EXPONENTIAL: e^{}
s({trig = '([^%a])ee', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>e^{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual)
    }
  ),
  { condition = tex.in_mathzone }
),
-- FRACTION: \frac{}{}
s({trig = '([^%a])ff', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    [[
      <>\frac{<>}{<>}
    ]],
    {
      f( function(_, snip) return snip.captures[1] end ),
      i(1),
      i(2)
    }
  ),
  { condition = tex.in_mathzone }
),
-- SUM with lower limit
s({trig = "([^%a])sM", wordTrig = false, regTrig = true, snippetType="autosnippet"},
  fmta(
    "<>\\sum_{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      i(1),
    }
  ),
  {condition = tex.in_mathzone}
),
-- SUM with upper and lower limit
s({trig = "([^%a])smm", wordTrig = false, regTrig = true, snippetType="autosnippet"},
  fmta(
    "<>\\sum_{<>}^{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      i(1),
      i(2),
    }
  ),
  {condition = tex.in_mathzone}
),

}
