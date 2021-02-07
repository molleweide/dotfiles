local snippets_nvim = require('snippets')

snippets_nvim.snippets = {
  _global = {
    todo = "TODO(dbalatero, ${=os.date('%Y-%m-%d', os.time() + 60 * 86400)}): ",
  };
}
