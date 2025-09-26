local prompts = {
  -- Code related prompts (from your original table)
  Explain = "Explain how this code works step by step, including its purpose, key logic, and any important details.",
  Review =
  "Review this code for potential issues, bugs, performance problems, and suggest specific improvements with examples.",
  Tests =
  "Generate comprehensive unit tests for this code, covering edge cases, error conditions, and expected behavior.",
  Refactor =
  "Refactor this code to improve readability, maintainability, and performance while preserving functionality.",
  FixCode = "Identify and fix any bugs or issues in this code, explaining what was wrong and why your solution works.",
  FixError = "Analyze this error message, explain the root cause, and provide a complete solution with corrected code.",
  BetterNamings = "Suggest more descriptive and meaningful names for variables, functions, and classes in this code.",
  Documentation =
  "Generate clear, comprehensive documentation including purpose, parameters, return values, and usage examples.",
  -- Text related prompts (from your original table)
  Summarize = "Create a concise summary highlighting the key points and main ideas from this text.",
  Spelling = "Fix all grammar, spelling, and punctuation errors while maintaining the original meaning and tone.",
  Wording = "Improve clarity, flow, and professional tone while keeping the original message intact.",
  Concise = "Rewrite this text to be more concise while preserving all important information and meaning.",
  -- New code-related prompts
  Optimize =
  "Analyze this code for performance bottlenecks and suggest optimizations with explanations and code examples.",
  DesignPattern =
  "Identify the most suitable design pattern for this code and provide an example implementation with explanations.",
  Security = "Review this code for security vulnerabilities and suggest specific fixes to ensure robust protection.",
  Convert =
  "Convert this code to [specify target language/framework], ensuring equivalent functionality and best practices.",
  Debug =
  "Step through this code to identify why it produces incorrect output, and provide a fix with detailed reasoning.",
  Comment =
  "Add clear, concise comments to this code to explain its logic, purpose, and key sections for better maintainability.",
  Scalability =
  "Evaluate this code for scalability issues and suggest improvements to handle increased load or data volume.",
  UserStory =
  "Write a user story for this feature, including acceptance criteria and edge cases, in standard Agile format.",
}

-- Helper function to create ask keymaps with both normal and visual modes
local function create_ask_keymap(key, prompt_key, desc)
  local prompt = prompts[prompt_key]
  return {
    {
      key,
      function()
        require("CopilotChat").ask("#buffers:visible\n\n" .. prompt)
      end,
      mode = "n",
      desc = "CopilotChat - " .. desc,
    },
    {
      key,
      function()
        require("CopilotChat").ask("#selection\n\n" .. prompt)
      end,
      mode = "v",
      desc = "CopilotChat - " .. desc,
    },
  }
end

-- Helper function to create prompt selection keymaps
local function create_prompt_keymap(key, desc)
  return {
    {
      key,
      function()
        -- Open prompt selection UI
        require("CopilotChat").select_prompt()
      end,
      mode = "n",
      desc = "CopilotChat - " .. desc,
    },
    {
      key,
      function()
        -- Open prompt selection UI
        require("CopilotChat").select_prompt()
      end,
      mode = "x",
      desc = "CopilotChat - " .. desc,
    },
  }
end


--j
local function setup_autocommands()
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "copilot-*",
    callback = function()
      vim.opt_local.relativenumber = true
      vim.opt_local.number = true
      vim.opt_local.signcolumn = "no"
    end,
  })
end


-- Flatten nested keymap arrays
local function flatten_keymaps(keymaps)
  local result = {}
  for _, keymap in ipairs(keymaps) do
    if type(keymap[1]) == "table" then
      -- It's a nested array, flatten it
      for _, nested_keymap in ipairs(keymap) do
        table.insert(result, nested_keymap)
      end
    else
      -- It's a single keymap
      table.insert(result, keymap)
    end
  end
  return result
end



local modified_prompts = {}
for key, prompt in pairs(prompts) do
  modified_prompts[key] = "#buffers:visible\n\n" .. prompt
end

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
          "nvim-treesitter/nvim-treesitter",
          "nvim-tree/nvim-web-devicons"
        },
        opts = {
          file_types = { "markdown", "copilot-chat" },
          anti_conceal = {
            enabled = false, -- Disable to keep rendering on cursor line
          },
          completions = {
            lsp = { enabled = true }, -- Enable LSP completions for checkboxes/callouts
          },
          -- Additional options if needed, e.g., for code blocks
          code = {
            enabled = true,
            style = {
              background = "Normal", -- Or customize as needed
            },
          },
        },
      },
    },
    branch = "main",
    opts = {
      window = {
        layout = "vertical",
        border = "rounded",
        width = 0.4,
        relative = "editor",
      },
      headers = {
        user = '-🧑🏼‍💻sajidcodes',
        assistant = '- 🤖 Copilot',
        tool = '- 🔧 Tool',
      },

      auto_fold = true, -- Automatically folds non-assistant messages

      prompts = modified_prompts,
      model = "claude-sonnet-4",
      mappings = {
        -- Use tab for completion
        complete = {
          detail = "Use @<Tab> or /<Tab> for options.",
          insert = "<Tab>",
        },
        -- Close the chat
        close = {
          normal = "q",
          insert = "<C-c>",
        },
        -- Reset the chat buffer
        reset = {
          normal = "<leader>al",
          insert = "<C-x>",
        },
        -- Submit the prompt to Copilot
        submit_prompt = {
          normal = "<CR>",
          insert = "<C-CR>",
        },
        -- Accept the diff
        accept_diff = {
          normal = "<C-y>",
          insert = "<C-y>",
        },
        -- Show help
        show_help = {
          normal = "g?",
        },
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      opts.prompts.Commit = {
            prompt =
            '> #git:staged\n\nWrite commit message with commitizen convention. Write clear, informative commit messages that explain the "what" and "why" behind changes, not just the "how".',
          },
          chat.setup(opts)
      setup_autocommands()
    end,
    keys = flatten_keymaps({
      -- Prompt actions
      create_prompt_keymap("<leader>ap", "Prompt actions"),

      -- Code analysis commands
      create_ask_keymap("<leader>ae", "Explain", "Explain code"),
      create_ask_keymap("<leader>ar", "Review", "Review code"),
      create_ask_keymap("<leader>aR", "Refactor", "Refactor code"),
      create_ask_keymap("<leader>an", "BetterNamings", "Better Naming"),
      -- Override the git prompts message
      -- Chat commands
      {
        "<leader>ai",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" and input ~= nil then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Ask input",
      },
      {
        "<leader>am",
        "<cmd>CopilotChatCommit<cr>",
        desc = "CopilotChat - Generate commit message for all changes",
      },
      -- Quick chat for normal mode (entire buffer)
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask("#buffers:visible\n\n" .. input)
          end
        end,
        desc = "CopilotChat - Quick chat with buffer",
      },
      -- Quick chat for visual mode (selected text)
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask("#selection\n\n" .. input)
          end
        end,
        mode = "v",
        desc = "CopilotChat - Quick chat with selection",
      },

      -- Utility commands
      { "<leader>af", "<cmd>CopilotChatFixError<cr>", desc = "CopilotChat - Fix Diagnostic" },
      { "<leader>al", "<cmd>CopilotChatReset<cr>",    desc = "CopilotChat - Clear buffer and chat history" },
      { "<leader>aa", "<cmd>CopilotChatToggle<cr>",   desc = "CopilotChat - Toggle" },
      { "<leader>a?", "<cmd>CopilotChatModels<cr>",   desc = "CopilotChat - Select Models" },
      { "<leader>as", "<cmd>CopilotChatStop<cr>",     desc = "CopilotChat - Stop current response" },
    }),
  },
}
