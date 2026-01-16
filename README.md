# Planning Plugin for Claude Code

A Claude Code plugin that transforms raw ideas, todos, and brainstorms into well-architected, actionable plans with proper design patterns, Agile/SCRUM structure, and TDD practices.

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
- **Test-Driven Development** - Enforces TDD for backend (80%+ coverage), pragmatic for frontend (40-60%)
- **Test Review Skill** - Dedicated skill to review test quality, coverage, and TDD compliance
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
| `/plan:test` | Review test quality and coverage | `/plan:test src/services` |
| `/plan:review` | Final code review against task criteria | `/plan:review` |

## Auto-Invoked Skills

### Planning Assistant
Automatically activates when Claude detects:
- Raw lists of todos or ideas
- Brainstorming sessions
- Unstructured feature requests
- "Help me plan..." type requests

### Test Review
Automatically activates when Claude detects:
- Requests to review tests or test quality
- Coverage reports or discussions
- Questions about what/how to test
- Code reviews involving test files

## Test-Driven Development

The plugin enforces TDD with layer-appropriate coverage targets:

| Layer | Coverage Target | Required? |
|-------|----------------|-----------|
| Services/Business Logic | 80%+ | **Yes** |
| Repositories/Data Access | 80%+ | **Yes** |
| API/Controllers | 70%+ | **Yes** |
| Utilities/Helpers | 90%+ | **Yes** |
| Frontend Components | 40-60% | Critical paths only |
| Frontend Styling | 0% | **Skip** |

**TDD Task Structure:**
```markdown
**Test First**:
- [ ] Write tests for expected behavior
- [ ] Include edge cases and error scenarios

**Then Implement**:
- [ ] Code to pass tests
```

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
- **Testing Requirements** - What tests to write first
- **Implementation Guidance** - Senior-level approach
- **Acceptance Criteria** - How to verify completion
- **Anti-patterns** - Mistakes to avoid

## Session Management

All work is automatically saved to organized session files:

| Session Type | Location | Filename Format |
|--------------|----------|-----------------|
| Planning | `sessions/planning/` | `planning-YYYY-MM-DD-title.md` |
| Review | `sessions/review/` | `review-YYYY-MM-DD-title.md` |
| Testing | `sessions/testing/` | `testing-YYYY-MM-DD-title.md` |

### Review Workflow

When `/plan:review` completes:
1. **Session saved** - Full review report to `sessions/review/`
2. **Passed tasks → Done** - Automatically marked "Done" in Linear/Jira
3. **Failed tasks → In Progress** - Returned with issues documented
4. **Follow-up tasks created** - For any new issues discovered

## File Structure

```
planning-plugin/
├── .claude-plugin/
│   └── plugin.json       # Plugin manifest
├── commands/
│   ├── refine.md         # /plan:refine
│   ├── session.md        # /plan:session
│   ├── tasks.md          # /plan:tasks
│   ├── breakdown.md      # /plan:breakdown
│   ├── test.md           # /plan:test
│   └── review.md         # /plan:review
├── skills/
│   ├── planning/
│   │   └── SKILL.md      # Planning assistant skill
│   └── test-review/
│       └── SKILL.md      # Test review skill
├── sessions/
│   ├── planning/         # planning-YYYY-MM-DD-title.md
│   ├── review/           # review-YYYY-MM-DD-title.md
│   └── testing/          # testing-YYYY-MM-DD-title.md
├── CLAUDE.md             # Plugin instructions for Claude
└── README.md             # This file
```

## Links

- [Dragonscale Marketplace](https://github.com/Dragonscale-Labs/marketplace)
- [Homepage](https://dragonscale.xyz)
- [Report Issues](https://github.com/dragonscale-labs/planning-plugin/issues)

## License

MIT
