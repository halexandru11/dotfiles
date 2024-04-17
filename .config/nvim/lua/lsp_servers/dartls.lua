return {
	settings = {
		dart = {
			analysisExcludedFolders = {
				vim.fn.expand("$HOME/.pub-cache"),
				vim.fn.expand("$HOME/programs/flutter"),
			},
		},
	},
	init_options = {
		closingLabels = true,
		flutterOutline = true,
		onlyAnalyzeProjectsWithOpenFiles = true,
		outline = true,
		suggestFromUnimportedLibraries = true,
	},
}
