---
description: Decompose complex tasks using Agile methodology and SWE patterns
---

# Break Down Complex Task

Transform a large, complex task into a well-structured backlog using Agile/SCRUM methodology and senior software engineering principles.

## Philosophy

**Complexity is the enemy of delivery.** Your job is to:
1. Break monoliths into manageable pieces
2. Identify hidden requirements through questioning
3. Structure work so proper patterns emerge naturally
4. Create self-contained tasks that any developer can pick up

## Input

Task to break down: "$ARGUMENTS"

If no arguments provided, ask the user to describe the complex task.

## Step 1: Discovery Questions (REQUIRED)

Before breaking down, use AskUserQuestion to uncover hidden complexity:

### Scope Clarification
- "What's the minimum viable version of this?"
- "What can we defer to a future iteration?"
- "Are there existing systems this must integrate with?"

### Technical Discovery
- "What data does this feature need to store/retrieve?"
- "Who/what will trigger this functionality?"
- "What should happen when things go wrong?"

### User Impact
- "How will users know this is working?"
- "What feedback should users receive?"
- "Are there different user roles with different access?"

**Ask 2-3 focused questions** to ensure you understand the full scope.

## Step 2: Agile Decomposition

### Level 1: Epic
The original complex task becomes an Epic - the high-level goal.

### Level 2: User Stories
Break the Epic into User Stories that deliver incremental value:
- Each story should be independently deployable
- Each story should be testable
- Use format: "As a [user], I want [goal] so that [benefit]"

### Level 3: Tasks
Break each User Story into technical tasks:
- Foundation tasks (data models, abstractions)
- Implementation tasks (business logic)
- Integration tasks (connecting pieces)
- Polish tasks (error handling, edge cases)

## Step 3: Apply Architectural Thinking

For each subtask, ensure proper layering:

### The Vertical Slice Approach
Instead of building all data models, then all services, then all UI:
- Build complete vertical slices that deliver value
- But ensure each slice follows proper patterns

### Pattern Application
Silently structure tasks to implement:

**For data-heavy features:**
- Repository pattern for data access
- DTOs for data transfer
- Migration tasks for schema changes

**For behavior-heavy features:**
- Service layer for business logic
- Strategy pattern for variants
- Command pattern for actions

**For event-driven features:**
- Observer/pub-sub patterns
- Event sourcing where appropriate
- Async job processing

**For user-facing features:**
- Presenter/ViewModel patterns
- Form validation layers
- Error boundary handling

## Step 4: Sprint-Ready Output

```markdown
## Epic: [Original Complex Task]

**Goal**: [What we're ultimately delivering]
**Success Metric**: [How we know it's done]

---

## User Stories

### Story 1: [Minimum Viable Slice]
**As a** [user type]
**I want** [goal]
**So that** [benefit]

**Acceptance Criteria:**
- [ ] User can...
- [ ] System validates...
- [ ] Error states handled...

**Technical Tasks:**

#### 1.1 [Foundation Task] `[Easy]` - Sprint 1
**Context**: [Why this task exists - enough for a fresh session]
**Architectural Purpose**: [What pattern/principle this enables]
**Implementation Notes**:
- Create X with Y structure
- Include Z for future extensibility
**Acceptance Criteria**:
- [ ] Specific deliverable 1
- [ ] Specific deliverable 2
**Dependencies**: None

#### 1.2 [Implementation Task] `[Medium]` - Sprint 1
**Context**: [Full context for fresh session]
**Builds On**: Task 1.1
...

---

### Story 2: [Enhanced Functionality]
...

---

## Architecture Overview

### Patterns Used
- **[Pattern Name]**: Applied in [tasks] because [reason]

### Layer Structure
```
[Presentation] → [Service] → [Repository] → [Data]
```

### Key Abstractions
- `IUserRepository` - Abstracts user data access
- `NotificationService` - Handles all notification logic

---

## Sprint Recommendations

### Sprint 1 (Foundation + MVP)
- Tasks: 1.1, 1.2, 1.3
- Delivers: [Minimum viable slice]

### Sprint 2 (Enhancement)
- Tasks: 2.1, 2.2
- Delivers: [Additional value]

---

## Risk Areas
- [Potential blockers or unknowns]

## Deferred Items
- [Things explicitly pushed to future iterations]
```

## Task Self-Containment Principle

**Every task must include:**
1. **Context** - Why this task exists (not just what)
2. **Architectural Purpose** - What pattern/principle it enables
3. **Implementation Notes** - Enough detail to start without prior context
4. **Acceptance Criteria** - How to verify it's done
5. **Dependencies** - What must be complete first

This ensures any developer (or Claude instance) can pick up the task cold.

## Guidelines

- **Question first, structure second** - Discovery prevents rework
- **Vertical slices over horizontal layers** - Deliver value incrementally
- **Patterns emerge from structure** - Users don't need to know the pattern names
- **Self-contained tasks** - Each task is a complete unit of work
- **Explicit > implicit** - When in doubt, write it out
