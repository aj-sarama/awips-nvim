if (vim.env.JDTLS_DATA == nil) then
	print("JDTLS_DATA does not exist.")
	return
end

if (vim.env.JDTLS_WORKSPACE == nil) then
	print("JDTLS_WORKSPACE does not exist.")
	return
end

if (vim.env.JDTLS_JAVA == nil) then
	print("JDTLS_JAVA does not exist.")
	return
end

if (vim.env.JDTLS_JDK == nil) then
	print("JDTLS_JDK does not exist.")
	return
end

if (vim.env.JDTLS_JAR == nil) then
	print("JDTLS_JAR does not exist.")
	return
end

if (vim.env.JDTLS_CONFIG == nil) then
	print("JDTLS_CONFIG does not exist.")
	return
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    vim.env.JDTLS_JAVA, -- or '/path/to/java21_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    '-jar', vim.env.JDTLS_JAR,
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version


    -- 💀
    '-configuration', vim.env.JDTLS_CONFIG,
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.


    -- 💀
    -- See `data directory configuration` section in the README
    '-data', vim.env.JDTLS_DATA
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  --
  -- vim.fs.root requires Neovim 0.10.
  -- If you're using an earlier version, use: require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  root_dir = vim.env.JDTLS_WORKSPACE,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    workspaceFolders = {
		-- "/home/andrew.sarama/awips2/hydro-time-series/ob-23.4.1/repos/AWIPS2_NWS",
		-- "/home/andrew.sarama/awips2/hydro-time-series/ob-23.4.1/repos/AWIPS2_Dev_Baseline"
	}
  },
  
	on_attach = function(client, bufnr)
		client.server_capabilities.semanticTokensProvider = nil
	end,
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
