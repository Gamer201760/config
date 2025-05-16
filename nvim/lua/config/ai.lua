require("mcphub").setup({
    extensions = {
        avante = {
            make_slash_commands = true, -- make /slash commands from MCP server prompts
        }
    },
})

require("avante").setup({
    -- other config
    -- The system_prompt type supports both a string and a function that returns a string. Using a function here allows dynamically updating the prompt with mcphub
    behaviour = {
        --- ... existing behaviours
        enable_cursor_planning_mode = true, -- enable cursor planning mode!
    },
    provider = "ollama",
    ollama = {
        endpoint = "http://192.168.1.209:11434", -- Note that there is no /v1 at the end.
        model = "GandalfBaum/llama3.2-claude3.7",
    },
    copilot = {
        model = "claude-3.5-sonnet"
    },
    vendors = {
        ["deepseek-r1"] = {
            __inherited_from = "ollama",
            endpoint = "http://192.168.1.209:11434", -- Note that there is no /v1 at the end.
            model = "deepseek-r1:7b",
        },
        ["qwen3"] = {
            __inherited_from = "ollama",
            endpoint = "http://192.168.1.209:11434", -- Note that there is no /v1 at the end.
            model = "qwen3",
        },
        ["gemma3"] = {
            __inherited_from = "ollama",
            endpoint = "http://192.168.1.209:11434", -- Note that there is no /v1 at the end.
            model = "gemma3:4b",
        },
        ["cogito"] = {
            __inherited_from = "ollama",
            endpoint = "http://192.168.1.209:11434", -- Note that there is no /v1 at the end.
            model = "code-cogito",
        },
        ["claude3.7"] = {
            __inherited_from = "ollama",
            endpoint = "http://192.168.1.209:11434", -- Note that there is no /v1 at the end.
            model = "code-claude3.7",
        },
        ["new-claude3.7"] = {
            __inherited_from = "ollama",
            endpoint = "http://192.168.1.209:11434", -- Note that there is no /v1 at the end.
            model = "hf.co/reedmayhew/Llama-3.1-8B-claude-3.7-sonnet-reasoning-distilled",
        },
    },
    disabled_tools = {
        "list_files",
        "search_files",
        "read_file",
        "create_file",
        "rename_file",
        "delete_file",
        "create_dir",
        "rename_dir",
        "delete_dir",
        "bash",
    },
    system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub:get_active_servers_prompt()
    end,
    -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
    custom_tools = function()
        return {
            require("mcphub.extensions.avante").mcp_tool(),
        }
    end,
    windows = {
        width  = 50,
        height = 50
    }
})
