---
name: mcp-setup
description: Configura servidores MCP (Model Context Protocol)
version: 1.0.0
---

# MCP-Setup Skill

## Purpose
Configure MCP (Model Context Protocol) servers for extended tooling. Sets up tools like filesystem, git, web search, etc.

## What is MCP?

Model Context Protocol allows AI to use external tools:
- File system operations
- Git commands
- Web search
- Database queries
- Custom tools

## Invocation

### Command
```
/omk-mcp-setup
/omk-mcp-setup --list
/omk-mcp-setup --enable filesystem
```

### Skill
```
$mcp-setup
$mcp-setup --list-available
$mcp-setup --configure all
```

## Available MCP Servers

| Server | Provides |
|--------|----------|
| `filesystem` | File operations |
| `git` | Git commands |
| `web-search` | Search web |
| `fetch` | Fetch URLs |
| `sqlite` | Database queries |
| `postgres` | PostgreSQL access |
| ` Brave-search` | Brave search API |

## Configuration

Creates `.omk/mcp.json`:
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path"]
    },
    "git": {
      "command": "uvx",
      "args": ["mcp-server-git"]
    },
    "web-search": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-brave-search"],
      "env": {
        "BRAVE_API_KEY": "your-key"
      }
    }
  }
}
```

## Setup Process

### 1. Detect Environment
```
- Check Node.js version
- Check Python/uv
- Check API keys
```

### 2. Install Servers
```
npm install -g @modelcontextprotocol/server-filesystem
uvx install mcp-server-git
```

### 3. Configure
```
Create .omk/mcp.json
Set environment variables
```

### 4. Test
```
Verify each server starts correctly
Test basic operations
```

## Example

```
User: mcp-setup

Kimi: Setting up MCP servers...
      
      Detected environment:
      ✓ Node.js 22.x
      ✓ Python 3.12
      
      Installing servers:
      ✓ filesystem
      ✓ git
      ✓ web-search
      
      Configuration:
      ? Enter Brave API key: [hidden]
      
      Testing connections...
      ✓ All servers responding
      
MCP setup complete! Tools available:
- read_file, write_file
- git_status, git_diff
- web_search
```

## Environment Variables

```bash
# Add to ~/.bashrc or ~/.zshrc
export BRAVE_API_KEY="your-key"
export GITHUB_TOKEN="your-token"
```
