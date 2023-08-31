require('telescope').setup{
    defaults = {
      file_ignore_patterns = { 'node_modules' },
      hidden = true
    },
  
    pickers = {
      find_files = {
      }
    },

    extensions = {
      file_browser = {
        cwd_to_path = true,
        hijack_netrw = true,
        theme = "ivy",
      }
    }
  }

require("telescope").load_extension "file_browser"
