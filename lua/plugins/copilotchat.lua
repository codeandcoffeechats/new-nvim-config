local prompts = {
  -- Code related prompts
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
  -- Text related prompts
  Summarize = "Create a concise summary highlighting the key points and main ideas from this text.",
  Spelling = "Fix all grammar, spelling, and punctuation errors while maintaining the original meaning and tone.",
  Wording = "Improve clarity, flow, and professional tone while keeping the original message intact.",
  Concise = "Rewrite this text to be more concise while preserving all important information and meaning.",
}

-- Helper function to create ask keymaps with both normal and visual modes
local function create_ask_keymap(key, prompt, desc)
  return {
    {
      key,
      function()
        require("CopilotChat").ask(prompt, { selection = require("CopilotChat.select").buffer })
      end,
      mode = "n",
      desc = "CopilotChat - " .. desc,
    },
    {
      key,
      function()
        require("CopilotChat").ask(prompt, { selection = require("CopilotChat.select").visual })
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
        require("CopilotChat").select_prompt({
          context = { "buffers" },
        })
      end,
      desc = "CopilotChat - " .. desc,
    },
    {
      key,
      function()
        require("CopilotChat").select_prompt()
      end,
      mode = "x",
      desc = "CopilotChat - " .. desc,
    },
  }
end


-- Helper function to setup autocommands
local function setup_autocommands()
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "copilot-*",
    callback = function()
      vim.opt_local.relativenumber = true
      vim.opt_local.number = true
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

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    -- version = "v3.7.0",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "diff", "markdown" } },
      },
    },
    opts = {
      window = {
        width = 0.4,
      },
      question_header = "👤 User ",
      answer_header = "🤖 Copilot ",
      error_header = "🔴 Error ",
      prompts = prompts,
      model = "gpt-5",
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
      local select = require("CopilotChat.select")

      local user = "User"
      opts.question_header = "  " .. user .. " "
      opts.answer_header = "  Copilot "

      -- Override the git prompts message
      opts.prompts.Commit = {
        prompt =
        '> #git:staged\n\nWrite commit message with commitizen convention. Write clear, informative commit messages that explain the "what" and "why" behind changes, not just the "how".',
      }

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
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, {
              selection = require("CopilotChat.select").buffer,
            })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },

      -- Utility commands
      { "<leader>af", "<cmd>CopilotChatFixError<cr>", desc = "CopilotChat - Fix Diagnostic" },
      { "<leader>al", "<cmd>CopilotChatReset<cr>",    desc = "CopilotChat - Clear buffer and chat history" },
      { "<leader>aa", "<cmd>CopilotChatToggle<cr>",   desc = "CopilotChat - Toggle" },
      { "<leader>a?", "<cmd>CopilotChatModels<cr>",   desc = "CopilotChat - Select Models" },
    }),
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = false,
    opts = {
      file_types = { "markdown", "copilot-chat" },
    },
    ft = { "markdown", "copilot-chat" },
  },
}
