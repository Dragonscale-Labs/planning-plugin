# Planning Plugin for Claude Code

A Claude Code plugin that helps organize raw ideas, todos, and brainstorms into structured, actionable plans.

## Features

- **Refine Ideas**: Structure unorganized thoughts into clear plans
- **Save Sessions**: Preserve planning work for future reference
- **Create Tasks**: Generate tickets in Linear or Jira
- **Break Down Complexity**: Decompose large tasks into manageable pieces
- **Auto-Planning Skill**: Claude automatically helps structure planning work

## Installation

### Option 1: Load Directly (Development/Testing)

```bash
claude --plugin-dir /path/to/planning-plugin
```

### Option 2: Install from Marketplace

If this plugin is published to a marketplace:

```bash
/plugin install plan
```

## Commands

| Command | Description | Example |
|---------|-------------|---------|
| `/plan:refine` | Structure raw ideas into plans | `/plan:refine Add login, fix bug, update docs` |
| `/plan:session` | Save current planning work | `/plan:session auth-feature` |
| `/plan:tasks` | Create tasks in Linear/Jira | `/plan:tasks` |
| `/plan:breakdown` | Decompose complex task | `/plan:breakdown Implement user authentication` |

## Task Management Setup

### Linear

```bash
claude mcp add --transport http linear https://mcp.linear.app/mcp
```

### Jira

Follow your organization's Atlassian Rovo MCP setup instructions.

The `/plan:tasks` command auto-detects which MCPs are connected.

## Workflow

1. **Dump** your raw ideas, todos, or brainstorm notes
2. **Refine** with `/plan:refine` or let the auto-skill structure them
3. **Break down** complex items with `/plan:breakdown`
4. **Save** your session with `/plan:session`
5. **Create tasks** in Linear/Jira with `/plan:tasks`

## Planning Principles

- **Easy wins first**: Tasks are prioritized by difficulty
- **Break down complexity**: Hard tasks get decomposed
- **Focus on what, not how**: Plans cover goals and requirements, not implementation
- **Preserve context**: Session files keep decisions and rationale

## File Structure

```
planning-plugin/
├── .claude-plugin/
│   └── plugin.json       # Plugin manifest
├── commands/
│   ├── refine.md         # /plan:refine
│   ├── session.md        # /plan:session
│   ├── tasks.md          # /plan:tasks
│   └── breakdown.md      # /plan:breakdown
├── skills/
│   └── planning/
│       └── SKILL.md      # Auto-invoked planning skill
├── sessions/             # Saved planning sessions
├── CLAUDE.md             # Plugin instructions for Claude
└── README.md             # This file
```

## License

MIT
