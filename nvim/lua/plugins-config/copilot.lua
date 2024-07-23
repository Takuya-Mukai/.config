require('copilot').setup {
  suggestion = { enabled = false },
  panel = { enabled = false },
  copilot_node_command = vim.fn.expand("$HOME") .. "/usr/local/bin/node"
}
