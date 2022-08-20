local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {

    -- formatting
    formatting.prettierd,
    -- null_ls.builtins.formatting.shfmt,
    formatting.fixjson,
    formatting.black.with { extra_args = { "--fast"} },
    formatting.autopep8,
    formatting.isort,
    -- with_root_file(null_ls.formatting.stylua, "style.toml"),

    -- diagnostics
    diagnostics.flake8,
    -- with_root_file(b.diagnostics.selene, "selene.toml"),
    -- with_diagnostics_code(null_ls.builtins.diagnostics.shellcheck),

    -- code actions
    -- null_ls.builtins.code_actions.gitsigns

}
null_ls.setup({ sources = sources })
