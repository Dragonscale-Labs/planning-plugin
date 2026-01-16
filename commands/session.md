---
description: Save the current planning session to a markdown file
---

# Save Planning Session

Save the current planning work as a session file for future reference.

## Instructions

1. **Review the conversation** - Look at the planning work done in this session
2. **Generate a brief description** - 2-4 words summarizing the session topic
3. **Create the filename** - Format: `YYYY-MM-DD-brief-description.md` using today's date
4. **Write the session file** to the `sessions/` directory

## Session File Format

```markdown
# Planning Session: [Brief Title]

**Date**: YYYY-MM-DD
**Status**: [Draft/Finalized/Tasks Created]

## Overview
Brief summary of what was planned in this session.

## Context
Why this planning was needed, what triggered it.

## Decisions Made
- Key decisions and their rationale
- Trade-offs considered

## Structured Plan

### Goals
- Goal 1
- Goal 2

### Tasks
[Include the refined task list with priorities and difficulty estimates]

## Next Steps
- Immediate actions to take
- Follow-up items

## Open Questions
- Unresolved items for future sessions
```

## After Saving

- Confirm the file was saved with its full path
- Suggest next steps (e.g., "Run `/plan:tasks` to create tickets from this plan")

## Arguments

Optional: "$ARGUMENTS" can specify a custom description for the filename.
