local opt_local = vim.opt_local

opt_local.cindent = true
opt_local.wrap = false
opt_local.expandtab = true
opt_local.cinkeys:remove({':'})
opt_local.cino:append({'g1', 'h1', 'j1', '(0', 'ws', 'Ws'})

-- Comment chars
opt_local.commentstring = "// %s"

