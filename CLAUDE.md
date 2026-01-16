# CLAUDE.md

This file provides guidance to Claude Code when working with this planning plugin.

## Plugin Overview

This is the **Planning Plugin** for Claude Code—a software engineering planning assistant that helps transform raw ideas into well-structured, architecturally sound plans.

## Core Philosophy

**Planning is the highest-leverage activity in software development.** This plugin embodies the principle that:

1. **Questions before answers** - Proactively discover requirements users haven't articulated
2. **Patterns before code** - Structure work so proper design patterns emerge naturally
3. **Foundation before features** - Build abstractions that make implementation easier
4. **Context in every task** - Each task must be executable without prior knowledge
5. **Architecture in-place** - Document patterns in folder CLAUDE.md files for future agents

## Available Commands

| Command | Description |
|---------|-------------|
| `/plan:refine` | Transform raw ideas into structured plans with proactive discovery |
| `/plan:session` | Save planning work to `sessions/` for future reference |
| `/plan:tasks` | Create self-contained tasks in Linear or Jira |
| `/plan:breakdown` | Decompose complex work using Agile methodology |

## Auto-Invoked Skill

The **planning-assistant** skill automatically activates when Claude detects:
- Raw lists of todos or ideas
- Brainstorming sessions or feature requests
- Unstructured requirements
- "Help me plan..." type requests
- Users who seem unsure where to start

## Planning Methodology

### 1. Proactive Discovery (REQUIRED)

**Always use AskUserQuestion to surface hidden requirements.** Users often don't know what they need until asked. Essential questions include:

- "What problem does this solve for your users?"
- "What's the minimum viable version?"
- "What happens when X fails?"
- "Are there security/privacy requirements?"
- "Will this need to scale? How much?"

**Ask 2-4 targeted questions before structuring any plan.**

### 2. Software Engineering Abstraction

Apply design patterns and proper layering silently—users don't need to know pattern names, but their code should use them:

**Design Patterns to Apply:**
- Repository Pattern - Data access abstraction
- Service Layer - Business logic separation
- Factory Pattern - Object creation
- Strategy Pattern - Interchangeable behaviors
- Observer Pattern - Event handling
- Dependency Injection - Testability

**Layer Structure:**
```
Presentation → API/Controllers → Services → Repositories → Data
```

**Foundation tasks build the bottom layers. Feature tasks connect them.**

### 3. Agile/SCRUM Structure

Organize all plans using:
- **Epics** - High-level goals
- **User Stories** - "As a [user], I want [X] so that [Y]"
- **Tasks** - Concrete, estimable work items
- **Acceptance Criteria** - Specific, testable conditions

### 4. Task Self-Containment

**Every task must include enough context to execute in a fresh Claude instance:**

- **Context** - Why this task exists
- **Architectural Purpose** - What pattern/principle it enables
- **Implementation Guidance** - Senior-level approach hints
- **Acceptance Criteria** - How to verify completion
- **Dependencies** - What must exist first
- **Anti-patterns** - Mistakes to avoid

### 5. Easy Wins First

Prioritize by difficulty:
- `[Easy]` - Straightforward, < 1 hour
- `[Medium]` - Some complexity, 1-4 hours
- `[Hard]` - Significant effort, consider breaking down

Order tasks with easy items first to build momentum.

### 6. Folder Architecture & CLAUDE.md Propagation

**Every plan must include Task 0: folder structure with CLAUDE.md files.**

Well-organized folder architecture enables future agentic work:
- Each architectural layer gets its own folder
- Each folder gets a CLAUDE.md documenting the pattern
- Future agents read folder CLAUDE.md to understand conventions

Example `services/CLAUDE.md`:
```markdown
# Services Layer

## Pattern: Service Layer
Services encapsulate business logic, are stateless, and depend on repositories.

## Conventions
- File naming: `{domain}_service.py`
- All services use dependency injection
- Return DTOs, not raw models

## Anti-Patterns
- Don't access database directly (use repositories)
- Don't handle HTTP concerns (controllers do that)
```

**Folder structure is architecture made visible.** Proper folders make patterns obvious and enforceable.

### 7. Test-Driven Development (TDD)

**Testing is not optional for backend/library code.**

**Coverage Targets:**

| Layer | Target | Notes |
|-------|--------|-------|
| Services | 80%+ | Required - business logic must be tested |
| Repositories | 80%+ | Required - data access must be tested |
| API/Controllers | 70%+ | Required - endpoints must be tested |
| Utilities | 90%+ | Required - helpers must be bulletproof |
| Frontend Components | 40-60% | Critical paths only |
| Frontend Styling | 0% | Skip unless visual regression needed |

**TDD Workflow:**
1. **Test First** - Write failing tests that define expected behavior
2. **Implement** - Write code to make tests pass
3. **Refactor** - Clean up while keeping tests green

**Task Structure for TDD:**
```markdown
**Test First**:
- [ ] Write tests for success case
- [ ] Write tests for error cases
- [ ] Write tests for edge cases

**Then Implement**:
- [ ] Implementation code to pass tests
```

**Frontend Testing Philosophy:**
- Test user-critical flows (login, checkout, forms)
- Test error handling and validation
- Don't test styling, layout, or purely visual elements
- Prefer integration tests over unit tests for UI

## Task Management Integration

### Linear MCP
```bash
claude mcp add --transport http linear https://mcp.linear.app/mcp
```

### Jira (Atlassian Rovo MCP)
Follow your organization's setup instructions.

The `/plan:tasks` command auto-detects connected MCPs.

## Task Format Guide

Every task created should follow this structure:

```markdown
## Overview
[What and WHY - 2-3 sentences]

## Context
[Background for someone with no prior knowledge]

## Architectural Purpose
[What pattern/layer this implements]

## Implementation Guidance
[Senior-level approach, key considerations, anti-patterns]

## Requirements
- [ ] Specific requirement 1
- [ ] Specific requirement 2

## Acceptance Criteria
- [ ] Testable criterion 1
- [ ] Testable criterion 2

## Dependencies
- Blocked by: [X]
- Blocks: [Y]

## Status Management
**IMPORTANT**: When working on this task:
- Move to **In Progress** when you start
- Move to **In Review** when complete
- Never skip statuses
```

## File Organization

```
planning-plugin/
├── .claude-plugin/       # Plugin manifest
├── commands/             # Slash commands
├── skills/               # Auto-invoked skills
├── sessions/             # Saved planning sessions
├── CLAUDE.md             # This file
└── README.md             # Installation instructions
```

## Guiding Principles

1. **Never skip discovery** - Questions surface 80% of hidden requirements
2. **Do the abstraction work** - Users may not know patterns, but their code should use them
3. **Vertical slices** - Deliver working increments, not horizontal layers
4. **Self-contained tasks** - Future-you (or another dev) needs full context
5. **Preserve the WHY** - Intent matters as much as implementation
6. **Task 0 always** - Folder architecture with CLAUDE.md files comes before any implementation
7. **Document in-place** - Future agents inherit context from folder CLAUDE.md files
8. **Test first for backend** - 80%+ coverage required for services/repositories
9. **Pragmatic frontend testing** - 40-60% coverage on critical paths, skip styling tests
