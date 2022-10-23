local xnoremap = require('doanphuduc.keymap').xnoremap

-- Execute macro in visual ranges
xnoremap('@', '":norm @" . getcharstr() . "<cr>"', { expr = true })
