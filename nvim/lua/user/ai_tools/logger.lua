local M = {}

local log_file = vim.fn.stdpath("data") .. "/ai_tools.log"

-- Log messages to a file with error handling
function M.log(message, level)
    local log_entry = string.format("[%s] %s: %s", os.date("%Y-%m-%d %H:%M:%S"), level or "INFO", message)
    local file, err = io.open(log_file, "a")

    if not file then
        -- Handle error gracefully
        print("Error opening log file: " .. (err or "Unknown error"))
        return
    end

    file:write(log_entry .. "\n")
    file:close()
end

return M
