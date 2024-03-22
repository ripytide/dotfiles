return {
	"axkirillov/hbac.nvim",
	opts = {
		autoclose = true, -- set autoclose to false if you want to close manually
		threshold = 6, -- hbac will start closing unedited buffers once that number is reached
		close_buffers_with_windows = true, -- hbac will close buffers with associated windows if this option is `true`
	},
}
