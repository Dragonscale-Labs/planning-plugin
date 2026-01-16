---
description: Final review of pending code changes against task acceptance criteria
---

# Code Review Command

Perform a final review of pending git changes, cross-referencing with tasks marked "In Review" in your task management system.

## Usage

```
/plan:review [options]
```

Examples:
- `/plan:review` - Review all pending changes against In Review tasks
- `/plan:review --staged` - Only review staged changes
- `/plan:review TASK-123` - Review changes for specific task

## What This Command Does

1. **Gather Pending Changes** - Analyze git diff (staged and unstaged)
2. **Fetch In Review Tasks** - Get tasks from Linear/Jira marked "In Review"
3. **Map Changes to Tasks** - Match code changes to their corresponding tasks
4. **Verify Acceptance Criteria** - Walk through each criterion with user
5. **Check Quality Standards** - Verify TDD, patterns, and conventions
6. **Generate Review Report** - Summary of what's ready to merge

## Review Process

### Step 1: Analyze Git State

Check current git status:
- Staged changes (ready to commit)
- Unstaged changes (modified but not staged)
- Untracked files (new files not added)

Provide summary:
```markdown
## Pending Changes

**Staged:**
- `src/services/UserService.ts` (+45, -12)
- `src/services/__tests__/UserService.test.ts` (+89, -0)

**Unstaged:**
- `src/controllers/AuthController.ts` (+23, -5)

**Untracked:**
- `src/utils/validation.ts`
```

### Step 2: Fetch In Review Tasks

Detect connected MCP (Linear or Jira) and fetch tasks with "In Review" status.

If no MCP connected, ask:
- "No task management MCP detected. Should I review code without task verification?"

Display found tasks:
```markdown
## Tasks In Review

1. **TASK-123**: Implement user authentication
   - Assigned: @developer
   - Acceptance Criteria: 4 items

2. **TASK-124**: Add password reset flow
   - Assigned: @developer
   - Acceptance Criteria: 3 items
```

### Step 3: Map Changes to Tasks

Attempt to match changes to tasks by:
- Branch name containing task ID
- Commit messages referencing task ID
- File paths matching task description
- Ask user to confirm mapping

Use AskUserQuestion:
```
"Which task do these changes belong to?"
Options:
- TASK-123: Implement user authentication
- TASK-124: Add password reset flow
- Multiple tasks
- No task (ad-hoc change)
```

### Step 4: Verify Acceptance Criteria

For each task, walk through acceptance criteria using AskUserQuestion:

```markdown
## Verifying: TASK-123 - Implement user authentication

### Acceptance Criteria Review
```

**For each criterion, ask:**

```
Criterion 1: "User can log in with email and password"

Does the implementation satisfy this criterion?
Options:
- ✅ Yes, fully implemented
- ⚠️ Partially implemented (needs work)
- ❌ Not implemented
- 🔍 Need to verify (show me the code)
```

If user selects "Need to verify", show relevant code snippets and ask again.

If "Partially" or "Not implemented":
```
What's missing or incomplete for this criterion?
Options:
- [Text input for details]
```

### Step 5: Quality Checks

After acceptance criteria, verify quality standards:

**TDD Compliance:**
```
Are tests written for this implementation?
Options:
- ✅ Yes, tests exist and pass
- ⚠️ Tests exist but incomplete
- ❌ No tests written
- N/A - Frontend styling (no tests needed)
```

**Coverage Check:**
```
Does test coverage meet targets?
- Backend (services/repos): 80%+ required
- Controllers: 70%+ required
- Frontend: 40-60% on critical paths

Options:
- ✅ Coverage meets targets
- ⚠️ Coverage below target but acceptable
- ❌ Coverage insufficient
- 🔍 Show coverage report
```

**Code Quality:**
```
Code quality verification:
- [ ] Follows established patterns (Repository, Service, etc.)
- [ ] No obvious security issues
- [ ] Error handling in place
- [ ] No console.logs or debug code

Any concerns?
Options:
- ✅ All good
- ⚠️ Minor issues (list them)
- ❌ Major issues (blocks merge)
```

**Documentation:**
```
Is documentation updated?
Options:
- ✅ Yes, docs updated
- ⚠️ Docs needed but not critical
- ❌ Missing critical documentation
- N/A - No docs needed
```

### Step 6: Generate Review Report

After all verifications, output:

```markdown
## Code Review Report

**Date:** 2024-01-15
**Reviewer:** [User]
**Branch:** feature/user-auth

---

### Tasks Reviewed

#### TASK-123: Implement user authentication ✅ READY

**Acceptance Criteria:**
- [x] User can log in with email and password
- [x] Invalid credentials show error message
- [x] Session persists across page refresh
- [x] Logout clears session

**Quality Checks:**
- [x] Tests: 85% coverage ✅
- [x] Patterns: Service layer properly used
- [x] Security: Password hashing implemented
- [x] Docs: API documentation updated

**Verdict:** Ready to merge

---

#### TASK-124: Add password reset flow ⚠️ NEEDS WORK

**Acceptance Criteria:**
- [x] User can request password reset
- [ ] Email sent with reset link ❌ NOT IMPLEMENTED
- [ ] Reset link expires after 24h ⚠️ PARTIAL

**Issues:**
1. Email sending not implemented - blocked by SMTP config
2. Expiry logic exists but not tested

**Verdict:** Not ready - 2 items need attention

---

### Summary

| Task | Status | Verdict |
|------|--------|---------|
| TASK-123 | ✅ All criteria met | Ready to merge |
| TASK-124 | ⚠️ 2 issues | Needs work |

### Recommended Actions

1. **TASK-123**: Approve and merge
2. **TASK-124**:
   - Create follow-up task for email integration
   - Add expiry tests before merging partial work

### Next Steps
- Merge TASK-123 to main
- Move TASK-124 back to "In Progress" with notes
```

### Step 7: Save Review Session

**Always save the review session** to `sessions/review/`:

**Filename format:** `review-YYYY-MM-DD-short-title.md`

Examples:
- `sessions/review/review-2024-01-15-user-auth.md`
- `sessions/review/review-2024-01-15-payment-flow.md`

**Review Session File Format:**
```markdown
# Review Session: [Brief Title]

**Date**: YYYY-MM-DD
**Branch**: [branch-name]
**Reviewer**: [User]

## Tasks Reviewed

### TASK-123: Implement user authentication
**Status**: ✅ PASSED
**Verdict**: Ready to merge

#### Acceptance Criteria
- [x] User can log in with email and password
- [x] Invalid credentials show error message
- [x] Session persists across page refresh

#### Quality Checks
- [x] Tests: 85% coverage
- [x] Patterns: Service layer properly used
- [x] Security: Password hashing implemented

---

### TASK-124: Add password reset flow
**Status**: ❌ NEEDS WORK
**Verdict**: Returned to In Progress

#### Acceptance Criteria
- [x] User can request password reset
- [ ] Email sent with reset link ❌
- [ ] Reset link expires after 24h ⚠️

#### Issues Found
1. Email sending not implemented
2. Expiry logic not tested

---

## Summary

| Task | Status | Action Taken |
|------|--------|--------------|
| TASK-123 | ✅ Passed | Marked Done |
| TASK-124 | ❌ Failed | Returned to In Progress |

## Follow-up Tasks Created
- [Link to any new tasks created for issues found]

## Related Sessions
- Planning: [link to related planning session]
- Testing: [link to related testing session]
```

### Step 8: Auto-Mark Passed Tasks as Done

**Tasks that pass all acceptance criteria are automatically marked "Done".**

After saving the review session:

1. **For each task that passed:**
   - Update status to "Done" in Linear/Jira
   - Add review completion comment with session link

2. **For each task that failed:**
   - Move back to "In Progress"
   - Add comment with issues found
   - Optionally create follow-up tasks

3. **Confirm actions taken:**
```markdown
## Status Updates Applied

✅ **TASK-123** → Marked as Done
   - All acceptance criteria verified
   - Review session: sessions/review/review-2024-01-15-user-auth.md

↩️ **TASK-124** → Returned to In Progress
   - 2 acceptance criteria not met
   - Issues documented in task comments
```

Use AskUserQuestion only if there's ambiguity:
```
TASK-125 has 4/5 criteria met. What should we do?
Options:
- ✅ Mark as Done (close enough)
- ↩️ Return to In Progress (must complete all)
- 🔀 Create follow-up task for remaining item
```

## Integration with Task Management

### Linear
- Fetches issues with "In Review" state
- Can update issue status after review
- Adds review comments to issues

### Jira
- Fetches issues in "In Review" column
- Can transition issues after review
- Adds review comments

## Arguments

"$ARGUMENTS" can specify:
- `--staged` - Only review staged changes
- `--task=TASK-123` - Review specific task only
- `--no-status-update` - Skip task status updates
- `--quick` - Skip detailed quality checks

## After Review

Based on results, suggest:
- `/plan:tasks` - Create follow-up tasks for issues found
- Commit and push if all passed
- Move tasks to appropriate status
