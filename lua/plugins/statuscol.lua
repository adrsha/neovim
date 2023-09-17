return {
  "luukvbaal/statuscol.nvim",
  event = 'BufEnter',
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      relculright = true,
      segments = {
        {
          sign = { name = { "Diagnostic" }, maxwidth = 1, colwidth = 2, auto = false },
          click = "v:lua.ScSa"
        },
        {
          text = { "", builtin.foldfunc, " " },
          condition = { builtin.not_empty, true, builtin.not_empty },
          click = "v:lua.ScFa"
        },
        { text = { "", builtin.lnumfunc, " " }, click = "v:lua.ScLa", },
      }
    })
  end,
}
