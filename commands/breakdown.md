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

### Folder Architecture & CLAUDE.md Propagation

**Every breakdown MUST include a Task 0: folder structure setup.**

For any complex feature:
1. **Define folder structure first** - Where will each layer's code live?
2. **Create CLAUDE.md for each folder** - Document the pattern in-place
3. **Future agents inherit context** - They read folder CLAUDE.md to understand conventions

Example task:
```markdown
#### 0.1 [Folder Structure & Architecture Docs] `[Easy]` - Sprint 0
**Context**: Before implementing, establish folder structure with documentation
**Architectural Purpose**: Enable future agents to understand and follow patterns
**Implementation Notes**:
- Create `src/services/` with CLAUDE.md documenting Service Layer pattern
- Create `src/repositories/` with CLAUDE.md documenting Repository pattern
- Create `src/models/` with CLAUDE.md documenting data conventions
**Acceptance Criteria**:
- [ ] All architectural folders exist
- [ ] Each folder has CLAUDE.md with pattern + conventions + examples
- [ ] Any agent can understand the architecture by reading folder docs
**Dependencies**: None - this is always first
```

### Test-Driven Development (TDD)

**Every task breakdown must include testing requirements.**

**TDD Task Structure:**
1. **Test First** - Write failing tests that define expected behavior
2. **Implement** - Write code to make tests pass
3. **Refactor** - Clean up while keeping tests green

**Coverage Expectations by Layer:**

| Layer | Target | Priority |
|-------|--------|----------|
| Services/Business Logic | 80%+ | **Required** |
| Repositories/Data Access | 80%+ | **Required** |
| API/Controllers | 70%+ | **Required** |
| Utilities/Helpers | 90%+ | **Required** |
| Frontend Components | 40-60% | Critical paths only |
| Frontend Styling | 0% | Skip unless visual regression needed |

**Example Task with TDD:**
```markdown
#### 1.2 [Service] Implement PaymentService `[Medium]`
**Test First**:
- [ ] Test successful payment processing
- [ ] Test handling of declined cards
- [ ] Test idempotency (duplicate requests)

**Then Implement**:
- [ ] PaymentService class
- [ ] Process payment method
- [ ] Error handling

**Acceptance Criteria**:
- [ ] All tests pass
- [ ] 80%+ code coverage
```

**Frontend Testing - Be Pragmatic:**
- Focus on user-critical flows (forms, checkout, auth)
- Test error states and validation
- Skip testing pure styling/layout
- Prefer integration tests over unit tests for UI

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

### Folder CLAUDE.md Files
- `src/services/CLAUDE.md` - Service layer conventions
- `src/repositories/CLAUDE.md` - Repository pattern docs
- `src/models/CLAUDE.md` - Data model conventions

---

## Sprint Recommendations

### Sprint 0 (Architecture Setup)
- Tasks: 0.1 (folder structure + CLAUDE.md files)
- Delivers: Documented architecture foundation

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
- **Folder structure is Sprint 0** - Always establish architecture with CLAUDE.md files first
- **Document patterns in-place** - Future agents read folder CLAUDE.md for context
