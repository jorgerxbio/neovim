return {
	"akinsho/bufferline.nvim",
	requires = "kyazdani42/nvim-web-devicons", -- para íconos en las pestañas
	config = function()
		-- Aquí es donde configuramos 'bufferline'
		require("bufferline").setup({
			options = {
				numbers = "none", -- Configura cómo mostrar los números
				close_command = "bdelete! %d", -- Comando para cerrar un buffer
				right_mouse_command = "bdelete! %d", -- Cerrar con clic derecho
				left_mouse_command = "buffer %d", -- Seleccionar buffer con clic izquierdo
				middle_mouse_command = nil, -- Opcional: acción para clic medio
				indicator_icon = "▎", -- Icono de indicador
				buffer_close_icon = "", -- Icono para cerrar el buffer
				modified_icon = "●", -- Icono para archivos modificados
				close_icon = "", -- Icono para cerrar los buffers

				-- Usar `get_element_icon` para obtener íconos, eliminando `show_buffer_default_icon`
				get_element_icon = function(buf)
					local devicons = require("nvim-web-devicons")
					local icon, _ = devicons.get_icon(buf.name, buf.ft, { default = false })
					return icon
				end,

				show_buffer_icons = true, -- Mostrar íconos en las pestañas
				show_buffer_close_icons = true, -- Mostrar icono de cierre
				show_tab_indicators = true, -- Mostrar indicadores de las pestañas
				persist_buffer_sort = true, -- Mantener el orden de los buffers
				enforce_regular_tabs = false, -- No forzar el uso de pestañas regulares
				always_show_bufferline = true, -- Siempre mostrar la barra de buffers
			},
		})
    -- Mapea las teclas para navegar entre las pestañas
    vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true })
	end,
}
