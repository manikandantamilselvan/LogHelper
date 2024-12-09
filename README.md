# Enhanced Logging Utility
LogsHelper class is a helpful utility for logging debug information during development. Here's a brief review and suggestions for potential improvement:

## Features

- **Debug-only Logs:** The use of `#if DEBUG` ensures that logs are only printed in debug mode, keeping production builds clean.
- **Rich Metadata:** Logs include details like file name, line number, column number, and function name for precise tracing.
- **Custom Log Levels:** The `LogType` enum provides different log levels with meaningful symbols, making logs easier to distinguish.

## Suggestions for Improvement

- **Thread Safety:** If this logging utility will be used in a multithreaded context, consider synchronizing the print statements or using a dedicated logging queue.
- **Custom Date Format:** The Date object in the logs could be formatted for better readability using a DateFormatter.
- **Log Output to File:** Add an option to write logs to a file, which is helpful for debugging issues reported by QA or beta users.
- **Optional Log Level Control:** Include a mechanism to filter logs by their level (e.g., only show .e or .w logs when a certain configuration is set).
- **Simplify Metadata:** If column and line numbers are not often used, consider making these optional to simplify log messages.

## Example Usage

```
LogsHelper.info("This is an info log")
LogsHelper.info("This is a warning", event: .w)
LogsHelper.printLogs("Item1", "Item2", "Item3", type: .i)
LogsHelper.printLogs(["Array item 1", "Array item 2"], type: .d)
```
## Example Output

Here’s what the output might look like in the **Xcode Debug Console:**

#### Scenario 1: Info Log

```
2024-12-09 13:45:32.123 [🔨] [LogsHelper.swift:10 info(_:event:fileName:line:column:funcName:)] -> This is an info log
```

#### Scenario 2: Warning Log

```
2024-12-09 13:45:32.124 [⚠️] [LogsHelper.swift:11 info(_:event:fileName:line:column:funcName:)] -> This is a warning
```
