return {
  {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
          -- Check if the ESP-IDF environment variable is set
    local esp_idf_path = os.getenv("IDF_PATH")
    if esp_idf_path then
      -- for esp-idf
      require'lspconfig'.clangd.setup{
        -- handlers = handlers,
        capabilities = capabilities;
        cmd = { "/home/elijah/.espressif/tools/esp-clang/16.0.1-fe4f10a809/esp-clang/bin/clangd", "--background-index", "--query-driver=**", },
        root_dir = function()
            -- leave empty to stop nvim from cd'ing into ~/ due to global .clangd file
        end
      }
  
    else
      -- clangd config
      require'lspconfig'.clangd.setup{
        -- cmd = { 'clangd', "--background-index", "--clang-tidy"},
        handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
          disable = { "cpp copyright" }
        })}
      }
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        -- Go to definition
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {buffer = event.buf})
    
        -- Return to previous location after going to definition
        vim.api.nvim_set_keymap('n', 'gb', '<C-t>', {})
    
        -- Go to definition in new tab
        vim.api.nvim_set_keymap('n', 'gdt', '<C-w><C-]><C-w>T', {})
    
        -- Code completion
        vim.api.nvim_set_keymap('i', '<C-Space>', '<C-x><C-o>', {})
    
        -- Don't open an empty buffer when triggering autocomplete
        vim.o.completeopt = 'menu'
    
        -- Show documentation for symbol
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {buffer = event.buf})
    
        -- Format code
        vim.keymap.set('n', 'F', '<cmd>lua vim.lsp.buf.format()<cr>', {buffer = event.buf})
    
        -- Rename symbol
        vim.keymap.set('n', '3r', '<cmd>lua vim.lsp.buf.rename()<cr>', {buffer = event.buf})
      end
    })
  end,
  }
}
