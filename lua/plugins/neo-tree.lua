return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- Esto es necesario para los íconos
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				width = 30,
				mappings = {
					["h"] = function(state)
						local node = state.tree:get_node()
						if node.type == "directory" and node:is_expanded() then
							require("neo-tree.sources.filesystem").toggle_directory(state, node)
						else
							require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
						end
					end,
					["l"] = function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						if node.type == "directory" then
							if not node:is_expanded() then
								require("neo-tree.sources.filesystem").toggle_directory(state, node)
							elseif node:has_children() then
								require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
							end
						end
						if node.type == "file" then
							require("neo-tree.utils").open_file(state, path)
						end
					end,
					["e"] = function()
						vim.api.nvim_exec("Neotree focus filesystem right", true)
					end,
					["b"] = function()
						vim.api.nvim_exec("Neotree focus buffers right", true)
					end,
					["g"] = function()
						vim.api.nvim_exec("Neotree focus git_status right", true)
					end,
				},
			},
			filesystem = {
				filtered_items = {
					visible = true, -- Mostrar archivos y carpetas filtradas
					hide_dotfiles = false, -- Muestra archivos `.git` y otros ocultos si se desea
				},
				git_status = true, -- Habilitar el estado Git
			},
			default_component_configs = {
				git_status = {
					symbols = {
						added = "✚", -- Ícono para archivos añadidos
						modified = "●", -- Ícono para archivos modificados
						deleted = "", -- Ícono para archivos eliminados
					},
				},
				-- Aquí puedes agregar configuraciones adicionales, como la personalización de íconos de archivos
				name = {
					use_git_status_colors = true, -- Utilizar los colores de estado de git en los nombres
				},
			},
		})

		-- Mapea el comando para abrir o cerrar NeoTree con <leader>e
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true })
	end,
}
