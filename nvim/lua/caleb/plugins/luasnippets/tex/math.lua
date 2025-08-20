local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local extras = require("luasnip.extras")
local fmta = require("luasnip.extras.fmt").fmta

local helpers = require('caleb.util.luasnip-helpers')
local get_visual = helpers.get_visual
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end


return {

--[[
-- DELIMITERS
]]--

-- DYNAMIC PARENTHESIS
s({trig = "l%(", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  fmta(
    [[
      \left( <> \right)<>
    ]],
    {
      i(1),
      i(0)
    }
  ),
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") * tex.in_mathzone}
),
-- DYNAMIC CURLY BRACES
s({trig = "l%{", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  fmta(
    [[
      \left{ <> \right}<>
    ]],
    {
      i(1),
      i(0)
    }
  ),
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),
-- DYNAMIC SQUARE BRACKETS
s({trig = "l%[", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  fmta(
    [[
      \left[ <> \right]<>
    ]],
    {
      i(1),
      i(0)
    }
  ),
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),
-- DYNAMIC ANGLE BRACKETS
s({trig = "l%<", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  fmta(
    [[
      \left<< <> \right>><>
    ]],
    {
      i(1),
      i(0)
    }
  ),
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),
-- DYNAMIC NORM
s({trig = "l%|", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  fmta(
    [[
      \left| <> \right|<>
    ]],
    {
      i(1),
      i(0)
    }
  ),
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),
-- DYNAMIC FLOOR
s({trig = "lfl", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  fmta(
    [[
      \left\lfloor <> \right\rfloor<>
    ]],
    {
      i(1),
      i(0)
    }
  ),
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),
-- DYNAMIC CEIL
s({trig = "lce", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  fmta(
    [[
      \left\lceil <> \right\rceil<>
    ]],
    {
      i(1),
      i(0)
    }
  ),
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),
-- PARENTHESIS
s({trig="(", wordTrig = false, snippetType="autosnippet"},
  {
    t("("),
    d(1, get_visual),
    t(")"),
    i(0),
  },
  { condition = tex.in_mathzone and require("luasnip.extras.conditions.expand").trigger_not_preceded_by("l") }
),
-- CURLY BRACES
s({trig="{", wordTrig = false, snippetType="autosnippet"},
  {
    t("{"),
    d(1, get_visual),
    t("}"),
    i(0),
  },
  { condition = tex.in_mathzone and require("luasnip.extras.conditions.expand").trigger_not_preceded_by("l") }
),
-- SQUARE BRACKETS
s({trig="[", wordTrig = false, snippetType="autosnippet"},
  {
    t("["),
    d(1, get_visual),
    t("]"),
    i(0),
  },
  { condition = tex.in_mathzone and require("luasnip.extras.conditions.expand").trigger_not_preceded_by("l") }
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
s({trig=";th", snippetType="autosnippet"},
  { t("\\theta") }, { condition = tex.in_mathzone }
),
s({trig=";ta", snippetType="autosnippet"},
  { t("\\tau") }, { condition = tex.in_mathzone }
),
s({trig=";d", snippetType="autosnippet"},
  { t("\\delta") }, { condition = tex.in_mathzone }
),
s({trig=";e", snippetType="autosnippet"},
  { t("\\epsilon") }, { condition = tex.in_mathzone }
),
s({trig=";f", snippetType="autosnippet"},
  { t("\\phi") }, { condition = tex.in_mathzone }
),
s({trig=";m", snippetType="autosnippet"},
  { t("\\mu") }, { condition = tex.in_mathzone }
),
s({trig=";d", snippetType="autosnippet"},
  { t("\\delta") }, { condition = tex.in_mathzone }
),
s({trig=";l", snippetType="autosnippet"},
  { t("\\lambda") }, { condition = tex.in_mathzone }
),
s({trig=";s", snippetType="autosnippet"},
  { t("\\sigma") }, { condition = tex.in_mathzone }
),
s({trig=";r", snippetType="autosnippet"},
  { t("\\rho") }, { condition = tex.in_mathzone }
),
s({trig=";o", snippetType="autosnippet"},
  { t("\\omega") }, { condition = tex.in_mathzone }
),
s({trig=";O", snippetType="autosnippet"},
  { t("\\Omega") }, { condition = tex.in_mathzone }
),
s({trig=";p", snippetType="autosnippet"},
  { t("\\pi") }, { condition = tex.in_mathzone }
),
s({trig=";P", snippetType="autosnippet"},
  { t("\\Pi") }, { condition = tex.in_mathzone }
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
-- SUPERSCRIPT WITH BRACKETS
s({trig = "([%w%)%]%}])bl", wordTrig=false, regTrig = true, snippetType="autosnippet"},
  fmta(
    "<>^{[<>]}",
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
    [[<>\hat{<>}]],
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
s({trig = "tt", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  fmta(
    [[
       \text{<>}<>
    ]],
    {
      i(1),
      i(0)
    }
  ),
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),
-- BOLD MATH TEXT
s({trig = "bf", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  fmta(
    [[
       \mathbf{<>}<>
    ]],
    {
      i(1),
      i(0)
    }
  ),
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),
-- 
s({trig = "rm", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  fmta(
    [[
       \mathrm{<>}<>
    ]],
    {
      i(1),
      i(0)
    }
  ),
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),
s({trig = "sq", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  fmta(
    [[
       \sqrt{<>}<>
    ]],
    {
      i(1),
      i(0)
    }
  ),
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),
s({trig = "sin", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  {
    t("\\sin"),
  },
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),
s({trig = "cos", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  {
    t("\\cos"),
  },
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),
s({trig = "tan", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  {
    t("\\tan"),
  },
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),
s({trig = "arcs", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  {
    t("\\arcsin"),
  },
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),
s({trig = "arcc", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  {
    t("\\arccos"),
  },
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
),
s({trig = "arct", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  {
    t("\\arctan"),
  },
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
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
s({trig = "ff", regTrig = true, wordTrig=false, snippetType="autosnippet"},
  fmta(
    [[
      \frac{<>}{<>}<>
    ]],
    {
      i(1),
      i(2),
      i(0)
    }
  ),
  {condition = require("luasnip.extras.conditions.expand").trigger_not_preceded_by("%a") and tex.in_mathzone}
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
-- INT with upper and lower limit
s({trig = "([^%a])int", wordTrig = false, regTrig = true, snippetType="autosnippet"},
  fmta(
    "<>\\int_{<>}^{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      i(1),
      i(2),
    }
  ),
  {condition = tex.in_mathzone}
),
s({trig="df", snippetType="autosnippet"},
  {
    t("\\diff")
  }, { condition = tex.in_mathzone }
),
s({trig="pt", snippetType="autosnippet"},
  {
    t("\\partial")
  }, { condition = tex.in_mathzone }
),

}
