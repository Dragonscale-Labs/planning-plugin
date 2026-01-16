---
description: Create tasks in Linear or Jira with full context and architectural guidance
---

# Create Tasks

Create well-structured tasks in the user's task management system. Each task will be self-contained with full context, architectural guidance, and implementation notes.

## Philosophy

**Tasks are contracts with your future self (or another developer).** Every task must:
1. Stand alone - executable without additional context
2. Carry principles - embed design patterns and best practices
3. Define done - clear acceptance criteria
4. Preserve intent - explain WHY, not just WHAT

## MCP Detection

First, detect which task management MCPs are available:

1. **Check for Linear MCP** - Look for Linear-related tools
2. **Check for Jira/Rovo MCP** - Look for Jira-related tools

Then:
- If **both** are connected: Ask the user which system to use
- If **one** is connected: Use that system
- If **none** are connected: Inform the user they need to connect an MCP

## Pre-Creation Questions (REQUIRED)

Before creating tasks, use AskUserQuestion to confirm:

### Task Scope
- "Should I create all tasks, or just the foundation/MVP tasks first?"
- "Are there any tasks you want to skip or defer?"

### Project Context
- "What project/team should these tasks be created in?"
- "Are there existing epics or parent issues to link to?"

### Assignment
- "Should tasks be assigned to anyone?"
- "What priority level for these tasks?"

## Task Template (Full Context Format)

Each task created must follow this comprehensive format:

### Title
Concise, action-oriented. Format: `[Layer] Verb + Object`
Examples:
- `[Data] Create User model with authentication fields`
- `[Service] Implement password hashing service`
- `[API] Add user registration endpoint`

### Description

```markdown
## Overview
[2-3 sentences: What this task accomplishes and WHY it matters]

## Context
[Background needed to understand this task without prior knowledge]
- What feature/epic this belongs to
- What problem it solves
- Where it fits in the architecture

## Architectural Purpose
[What design principles this task embodies]
- Pattern being implemented (e.g., Repository Pattern)
- Layer this belongs to (Data/Service/API/UI)
- How this enables future extensibility

## Implementation Guidance

### Approach
[High-level approach a senior developer would take]

### Key Considerations
- [Important decision point 1]
- [Important decision point 2]
- [Edge case to handle]

### Code Structure Hints
```
[Suggested file/class/function structure]
```

### Anti-Patterns to Avoid
- [Common mistake 1]
- [Common mistake 2]

## Requirements
- [ ] Requirement 1 (specific and testable)
- [ ] Requirement 2
- [ ] Requirement 3

## Acceptance Criteria
- [ ] [Specific, verifiable criterion]
- [ ] [Another criterion]
- [ ] Tests pass / Test coverage maintained
- [ ] No new linting errors

## Dependencies
- **Blocked by**: [Task IDs or descriptions]
- **Blocks**: [What can't start until this is done]

## Status Management
**IMPORTANT**: When working on this task:
- Move to **In Progress** when you start working
- Move to **In Review** when implementation is complete
- Never skip statuses (don't go directly from Todo to In Review)

## Technical Notes
[Any additional context: related docs, similar implementations, gotchas]

## Definition of Done
- [ ] Code implemented and self-reviewed
- [ ] Tests written and passing
- [ ] Documentation updated (if applicable)
- [ ] PR created and ready for review
```

### Labels
- Difficulty: `easy`, `medium`, or `hard`
- Layer: `data`, `service`, `api`, `ui`
- Type: `foundation`, `feature`, `enhancement`, `bugfix`, `architecture`

## Special Task: Folder Architecture Setup

**Always create a Task 0 for folder architecture setup.** This task establishes the folder structure and creates CLAUDE.md files that future agents will read.

Example Task 0:
```markdown
## Title
[Architecture] Set up folder structure with CLAUDE.md documentation

## Overview
Establish organized folder architecture with CLAUDE.md files in each layer folder. This enables future agents to understand patterns and conventions without external context.

## Context
Before any implementation, we need documented architecture. Each folder containing a design pattern gets a CLAUDE.md explaining:
- What pattern this folder implements
- Naming conventions
- How files should be structured
- Common anti-patterns to avoid

## Implementation Guidance
Create these folders and CLAUDE.md files:
- `src/models/CLAUDE.md` - Data model conventions
- `src/repositories/CLAUDE.md` - Repository pattern documentation
- `src/services/CLAUDE.md` - Service layer conventions
- `src/api/CLAUDE.md` - API/Controller conventions

Each CLAUDE.md should include:
1. Pattern name and purpose
2. File/class naming conventions
3. Dependency rules (what can import what)
4. Example code structure
5. Testing expectations

## Acceptance Criteria
- [ ] All architectural folders created
- [ ] Each folder has CLAUDE.md
- [ ] CLAUDE.md files contain pattern docs, conventions, and examples
- [ ] Future agents can understand architecture by reading folder docs
```

## Jira-Specific Adaptations

For Jira, adapt the format:
- Use appropriate issue type (Epic → Story → Task → Subtask)
- Map difficulty to story points if configured
- Use Jira's native fields for dependencies
- Include labels for searchability

## Workflow

1. **Review the current plan** - Identify all tasks to create
2. **Ask confirmation questions** - Verify scope and project details
3. **Show task preview** - List titles and brief descriptions for approval
4. **Create tasks** - Use appropriate MCP tools
5. **Report results** - Provide links to created tasks
6. **Suggest next steps** - "Start with Task X (foundation)" etc.

## Arguments

"$ARGUMENTS" can specify:
- `--linear` or `--jira` to skip auto-detection
- `--project=X` to specify target project
- `--mvp-only` to create only foundation/MVP tasks
- A file path to read tasks from a saved session

## Quality Checklist

Before creating each task, verify:
- [ ] Title is action-oriented and indicates layer
- [ ] Context is sufficient for a fresh developer
- [ ] Architectural purpose is documented
- [ ] Acceptance criteria are specific and testable
- [ ] Dependencies are explicitly listed
- [ ] Anti-patterns are noted where relevant
- [ ] Task 0 (folder architecture + CLAUDE.md) is included if this is a new feature area
