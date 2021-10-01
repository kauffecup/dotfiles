local g = vim.g

-- Allow auto formatting for files without @format or @prettier tag
-- Change to 1 for projects that don't want autoformatting
g['prettier#autoformat_require_pragma'] = 1

-- Enable auto formatting when a config file can be found in the current directory or any parent directory
g['prettier#autoformat_config_present'] = 1
