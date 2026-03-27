---
name: clipboard
description: Copy content to system clipboard. Accepts text/file path or defaults to most recent assistant output. Invoked with /clipboard or "copy to clipboard".
version: 1.0.0
---

# Clipboard Copy

This skill copies content to the system clipboard using `xclip -selection clipboard`.

## Purpose

Copy text or code to the system clipboard for easy pasting into other applications.

## When to Use

Invoke this skill when:
- User types `/clipboard` with optional text or file path
- User asks to "copy to clipboard", "copy this", "put this in clipboard"
- User wants to copy the most recent assistant output

## Usage Patterns

### Copy Most Recent Assistant Output (Default)

When user invokes without arguments:

```
/clipboard
```

Process as:
1. Extract the most recent assistant message from the conversation
2. Copy the full text content to clipboard using `xclip -selection clipboard`
3. Confirm the copy with character/line count

### Copy Specific Text

When user provides text directly:

```
/clipboard This is the text I want to copy
/clipboard "multi-line
text content here"
```

Process as:
1. Parse all text following the `/clipboard` command as $ARGUMENTS
2. Copy that text to clipboard
3. Confirm the copy

### Copy File Contents

When user provides a file path:

```
/clipboard /path/to/file.txt
/clipboard src/main.go
```

Process as:
1. Detect that argument is a file path (contains `/` or is a valid file)
2. Use Read tool to load the file content
3. Copy the file content to clipboard
4. Confirm the copy with file name and size

### Natural Language

When user asks naturally:

```
"Copy that to clipboard"
"Put the previous output in my clipboard"
"Copy this code: [code block]"
```

Process as:
1. Identify what content the user wants copied
2. Apply the appropriate copy method
3. Confirm the action

## Implementation Process

### Step 1: Determine Content Source

Check $ARGUMENTS:
- **Empty/missing**: Use most recent assistant output
- **File path** (contains `/`, `.`, or exists as file): Read file content
- **Text**: Use the provided text directly

### Step 2: Copy to Clipboard

Use bash command:
```bash
echo -n "$CONTENT" | xclip -selection clipboard
```

Important:
- Use `-n` flag with echo to avoid adding trailing newline
- Use `-selection clipboard` for the standard clipboard (not primary selection)
- Ensure xclip is available; if not, inform user to install it

### Step 3: Confirm Success

After copying, inform the user:
```
✓ Copied to clipboard (XXX characters, YY lines)
```

Or for files:
```
✓ Copied file.txt to clipboard (XXX characters, YY lines)
```

## Handling Edge Cases

### xclip Not Installed

If `xclip` is not available:
```
Error: xclip is not installed. Install it with:
  sudo apt install xclip    # Debian/Ubuntu
  sudo dnf install xclip    # Fedora
  sudo pacman -S xclip      # Arch
```

### Empty Content

If the content to copy is empty:
```
Warning: No content to copy (empty input)
```

### File Not Found

If a file path is provided but doesn't exist:
```
Error: File not found: /path/to/file.txt
```

### Very Large Content

For content > 1MB:
```
Warning: Copying large content to clipboard (X.XX MB)
```

## Examples

### Example 1: Copy Last Assistant Output

User: `/clipboard`

Process:
1. Extract the last assistant message
2. Copy to clipboard
3. Confirm: "✓ Copied to clipboard (450 characters, 12 lines)"

### Example 2: Copy Specific Text

User: `/clipboard export DATABASE_URL=postgresql://localhost/mydb`

Process:
1. Parse the text after `/clipboard`
2. Copy "export DATABASE_URL=postgresql://localhost/mydb"
3. Confirm: "✓ Copied to clipboard (47 characters, 1 line)"

### Example 3: Copy File

User: `/clipboard ~/.bashrc`

Process:
1. Detect file path
2. Read /home/user/.bashrc
3. Copy contents
4. Confirm: "✓ Copied .bashrc to clipboard (2.5 KB, 85 lines)"

### Example 4: Natural Language

User: "Can you copy that code snippet to my clipboard?"

Process:
1. Identify the code snippet from context (previous message)
2. Copy it to clipboard
3. Confirm: "✓ Copied to clipboard (234 characters, 8 lines)"

## Implementation Notes

### Extracting Most Recent Assistant Output

When no arguments provided:
1. Look at the conversation history
2. Find the most recent assistant message
3. Extract all text content (excluding tool calls and system messages)
4. If the message contains code blocks, include them with their content

### File Path Detection

A string is likely a file path if:
- It starts with `/` (absolute path)
- It starts with `~` (home directory)
- It starts with `./` or `../` (relative path)
- It contains path separators and has a file extension
- It matches an existing file when tested with Read tool

### Preserving Formatting

When copying:
- Preserve all whitespace, indentation, and newlines
- Keep code block formatting
- Maintain markdown formatting if present in assistant output

## Security Considerations

- Don't copy sensitive content without user awareness
- Warn if copying files that might contain secrets (.env, credentials, keys)
- Consider the clipboard is accessible to all applications

## Quick Reference

**Trigger phrases:**
- `/clipboard`
- `/clipboard [text]`
- `/clipboard [filepath]`
- "copy to clipboard"
- "copy this"
- "put in clipboard"

**Core function:** Copy specified content (or last assistant output) to system clipboard using xclip.

**Default behavior:** When invoked without arguments, copies the most recent assistant message.
