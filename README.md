# Planning Plugin for Claude Code

A Claude Code plugin that transforms raw ideas, todos, and brainstorms into well-architected, actionable plans with proper design patterns and Agile/SCRUM structure.

Part of the [Dragonscale Marketplace](https://github.com/Dragonscale-Labs/marketplace).

## Installation

### From Dragonscale Marketplace (Recommended)

First, add the Dragonscale marketplace to Claude Code:

```bash
claude /plugin marketplace add Dragonscale-Labs/marketplace
```

Then install the planning plugin:

```bash
claude /plugin install dragonscale/plan
```

## Features

- **Proactive Discovery** - Asks questions to surface requirements you haven't thought of
- **Design Patterns** - Silently structures work so proper patterns emerge (Repository, Service Layer, Factory, etc.)
- **Agile/SCRUM** - Organizes plans with Epics, User Stories, Tasks, and Acceptance Criteria
- **Self-Contained Tasks** - Every task includes full context for execution in a fresh session
- **Folder Architecture** - Creates CLAUDE.md files in code folders so future agents inherit architectural context
- **Task Management** - Creates tickets in Linear or Jira (auto-detects connected MCPs)

## Commands

| Command | Description | Example |
|---------|-------------|---------|
| `/plan:refine` | Structure raw ideas into plans | `/plan:refine Add login, fix bug, update docs` |
| `/plan:session` | Save current planning work | `/plan:session auth-feature` |
| `/plan:tasks` | Create tasks in Linear/Jira | `/plan:tasks` |
| `/plan:breakdown` | Decompose complex task | `/plan:breakdown Implement user authentication` |

## Auto-Invoked Skill

The plugin includes a **planning-assistant** skill that automatically activates when Claude detects:
- Raw lists of todos or ideas
- Brainstorming sessions
- Unstructured feature requests
- "Help me plan..." type requests

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

### Proactive Discovery
Every command asks 2-4 targeted questions to surface hidden requirements before structuring plans.

### Design Patterns Applied Silently
Plans structure work so these patterns emerge naturally:
- Repository Pattern (data access)
- Service Layer (business logic)
- Factory Pattern (object creation)
- Strategy Pattern (interchangeable behaviors)
- Observer Pattern (events)
- Dependency Injection (testability)

### Task 0: Folder Architecture
Every plan includes a "Sprint 0" task that:
- Creates organized folder structure (`models/`, `services/`, `repositories/`, `api/`)
- Adds `CLAUDE.md` to each folder documenting the pattern
- Enables future agents to understand architecture by reading folder docs

### Self-Contained Tasks
Every task includes:
- **Context** - Why this task exists
- **Architectural Purpose** - What pattern it implements
- **Implementation Guidance** - Senior-level approach
- **Acceptance Criteria** - How to verify completion
- **Anti-patterns** - Mistakes to avoid

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

## Links

- [Dragonscale Marketplace](https://github.com/Dragonscale-Labs/marketplace)
- [Homepage](https://dragonscale.xyz)
- [Report Issues](https://github.com/dragonscale-labs/planning-plugin/issues)

## License

MIT
