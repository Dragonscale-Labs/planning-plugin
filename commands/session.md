---
description: Save the current planning session to a markdown file
---

# Save Planning Session

Save the current planning work as a session file for future reference.

## Instructions

1. **Review the conversation** - Look at the planning work done in this session
2. **Generate a brief description** - 2-4 words summarizing the session topic
3. **Create the filename** - Format: `planning-YYYY-MM-DD-brief-description.md`
4. **Write the session file** to `sessions/planning/`

## File Naming

```
sessions/planning/planning-YYYY-MM-DD-brief-description.md
```

Examples:
- `sessions/planning/planning-2024-01-15-user-auth.md`
- `sessions/planning/planning-2024-01-15-payment-integration.md`

## Session File Format

```markdown
# Planning Session: [Brief Title]

**Date**: YYYY-MM-DD
**Status**: [Draft/Finalized/Tasks Created]
**Tasks Created**: [Links to Linear/Jira tasks if created]

## Overview
Brief summary of what was planned in this session.

## Context
Why this planning was needed, what triggered it.

## Discovery Questions Asked
- Question 1 → Answer/Decision
- Question 2 → Answer/Decision

## Decisions Made
- Key decisions and their rationale
- Trade-offs considered
- Patterns selected (Repository, Service Layer, etc.)

## Structured Plan

### Epic
[High-level goal]

### User Stories
- US-1: As a [user], I want [X] so that [Y]

### Tasks

#### Sprint 0: Architecture
- [ ] Task 0: Folder structure + CLAUDE.md files

#### Sprint 1: Foundation
- [ ] Task 1 `[Difficulty]`
- [ ] Task 2 `[Difficulty]`

#### Sprint 2: Features
- [ ] Task 3 `[Difficulty]`

## Testing Requirements
- Backend coverage target: 80%+
- Frontend coverage target: 40-60%
- Key test scenarios identified

## Architecture Notes
- Folder structure defined
- Patterns to implement
- CLAUDE.md files to create

## Next Steps
- [ ] Run `/plan:tasks` to create tickets
- [ ] Immediate actions to take
- [ ] Follow-up items

## Open Questions
- Unresolved items for future sessions

## Related Sessions
- Links to related planning/review/testing sessions
```

## After Saving

- Confirm the file was saved with its full path
- Suggest next steps:
  - `/plan:tasks` - Create tickets from this plan
  - `/plan:breakdown` - Further decompose any complex tasks
  - `/plan:test` - Review testing strategy

## Arguments

"$ARGUMENTS" can specify:
- A custom description for the filename
- `--draft` - Mark as draft status
- `--finalized` - Mark as finalized status
