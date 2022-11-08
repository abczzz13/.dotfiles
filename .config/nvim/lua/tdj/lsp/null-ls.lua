local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions

local sources = {
    formatting.black.with { extra_args = { "--fast", "--line-length", "88"} },
    formatting.autopep8.with { extra_args = { "--max-line-length", "88"} },
    formatting.isort.with { extra_args = { "--profile", "black" } },
    -- diagnostics.flake8.with { extra_args = { "--max-line-length", "88", "--extend-ignore", "E203" } },
    -- diagnostics.pylint.with { extra_args = { "--max-line-length", "88", "--disable", "C0330" } },
    actions.gitsigns
    --[[
    -- formatting
    -- formatting.prettierd,
    -- null_ls.builtins.formatting.shfmt,
    -- formatting.fixjson,
    formatting.black.with { extra_args = { "--fast", "--line-length", "88"} },
    formatting.autopep8.with { extra_args = { "--max-line-length", "88"} },
    formatting.isort.with { extra_args = { "--profile", "black" } },
    -- with_root_file(null_ls.formatting.stylua, "style.toml"),

    -- diagnostics
    diagnostics.flake8.with { extra_args = { "--max-line-length", "88", "--extend-ignore", "E203" } },
    diagnostics.pylint.with { extra_args = { "--max-line-length", "88", "--disable", "C0330" } },
    -- with_root_file(b.diagnostics.selene, "selene.toml"),
    -- with_diagnostics_code(null_ls.builtins.diagnostics.shellcheck),

    -- code actions
    actions.gitsigns
    ]]
}
null_ls.setup({
    sources = sources,
    -- debug = true,
})
