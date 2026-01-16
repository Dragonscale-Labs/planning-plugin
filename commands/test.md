---
description: Review test quality, coverage, and TDD compliance
---

# Test Review Command

Review test suites for quality, coverage compliance, and TDD best practices.

## Usage

```
/plan:test [path or scope]
```

Examples:
- `/plan:test` - Review all tests in the project
- `/plan:test src/services` - Review tests for services directory
- `/plan:test UserService` - Review tests for specific component

## What This Command Does

1. **Analyze Coverage** - Check coverage meets targets by layer
2. **Review Quality** - Evaluate test structure, naming, and completeness
3. **Identify Gaps** - Find missing test cases and untested scenarios
4. **Check TDD Compliance** - Verify tests define behavior, not implementation
5. **Provide Recommendations** - Actionable improvements with code examples

## Coverage Standards

**These are non-negotiable for backend code:**

| Layer | Minimum | Target | Status Check |
|-------|---------|--------|--------------|
| Services/Business Logic | 75% | 80%+ | ❌ if below 75% |
| Repositories/Data Access | 75% | 80%+ | ❌ if below 75% |
| API/Controllers | 65% | 70%+ | ❌ if below 65% |
| Utilities/Helpers | 85% | 90%+ | ❌ if below 85% |
| Frontend Components | 35% | 40-60% | Only critical paths |
| Frontend Styling | 0% | 0% | Should be skipped |

## Review Process

### Step 1: Gather Information

Use AskUserQuestion to understand scope:
- "Which area should I focus on? (all, backend, frontend, specific service)"
- "Do you have a coverage report I can analyze?"
- "Are there specific concerns about test quality?"

### Step 2: Analyze Tests

For each test file, evaluate:

**Coverage Metrics:**
- Line coverage percentage
- Branch coverage percentage
- Uncovered lines/functions

**Test Quality (AAA Pattern):**
- Clear Arrange/Setup
- Single Act/Action
- Specific Assert/Verification

**Test Completeness:**
- Happy path covered
- Error cases covered
- Edge cases covered (null, empty, boundary)

**Test Independence:**
- No order dependencies
- Proper cleanup
- No shared mutable state

### Step 3: Output Review

Provide structured output:

```markdown
## Test Coverage Review

### Summary
| Component | Coverage | Target | Status |
|-----------|----------|--------|--------|
| UserService | 85% | 80% | ✅ |
| OrderRepository | 72% | 80% | ❌ |
| AuthController | 68% | 70% | ⚠️ |

### Overall Health: [Good/Needs Work/Critical]

---

### Coverage Gaps

#### High Priority (Backend < 75%)
1. `OrderRepository` - 72% coverage
   - Missing: error handling for database failures
   - Missing: edge case for empty result sets

#### Medium Priority (Backend 75-80%)
2. `PaymentService` - 77% coverage
   - Missing: refund timeout scenario

---

### Quality Issues

#### Critical
- [ ] `UserService.test.ts:45` - No assertions in test
- [ ] `OrderRepository.test.ts` - Tests depend on execution order

#### Warnings
- [ ] `AuthController.test.ts` - Testing implementation details (mock call counts)

---

### Missing Test Cases

#### UserService
```typescript
// Missing: Test for concurrent updates
it('should handle concurrent profile updates', async () => {
  // Arrange
  const user = await createTestUser();

  // Act - Simulate concurrent updates
  const [result1, result2] = await Promise.all([
    userService.updateProfile(user.id, { name: 'A' }),
    userService.updateProfile(user.id, { name: 'B' }),
  ]);

  // Assert - One should succeed, one should fail or merge
  expect(/* appropriate assertion */).toBe(true);
});
```

#### OrderRepository
```typescript
// Missing: Test for database connection failure
it('should throw ServiceUnavailable when database is down', async () => {
  // Arrange
  mockDb.simulateConnectionFailure();

  // Act & Assert
  await expect(orderRepository.findById('123'))
    .rejects.toThrow(ServiceUnavailableError);
});
```

---

### Recommendations

#### Immediate Actions
1. Add missing error handling tests to `OrderRepository`
2. Fix assertion-free test in `UserService.test.ts:45`
3. Remove order dependency in `OrderRepository.test.ts`

#### Next Sprint
1. Increase `PaymentService` coverage to 80%+
2. Add integration tests for checkout flow
3. Document testing conventions in `tests/CLAUDE.md`

---

### Frontend Testing Notes

Current frontend coverage: 45% ✅ (within 40-60% target)

**Well Tested:**
- Login flow
- Form validation

**Consider Adding:**
- Error state handling in Dashboard
- Loading states in UserProfile

**Skip (as expected):**
- Styling tests
- Layout tests
```

## Save Testing Session

**Always save the testing review** to `sessions/testing/`:

**Filename format:** `testing-YYYY-MM-DD-short-title.md`

Examples:
- `sessions/testing/testing-2024-01-15-user-service.md`
- `sessions/testing/testing-2024-01-15-full-coverage-audit.md`

**Testing Session File Format:**
```markdown
# Testing Session: [Brief Title]

**Date**: YYYY-MM-DD
**Scope**: [What was reviewed - all, backend, specific service]

## Coverage Summary

| Component | Coverage | Target | Status |
|-----------|----------|--------|--------|
| UserService | 85% | 80% | ✅ |
| OrderRepository | 72% | 80% | ❌ |
| AuthController | 68% | 70% | ⚠️ |

**Overall Health**: [Good/Needs Work/Critical]

## Quality Assessment

### Strengths
- [What's done well]

### Issues Found
| Severity | Issue | Location |
|----------|-------|----------|
| Critical | No assertions | UserService.test.ts:45 |
| Warning | Implementation detail testing | AuthController.test.ts |

## Missing Test Cases

### High Priority
1. `OrderRepository` - Database failure handling
2. `PaymentService` - Refund timeout scenario

### Medium Priority
1. `UserService` - Concurrent update handling

## Recommendations

### Immediate Actions
1. [What to fix now]

### Next Sprint
1. [What to address later]

## Tasks Created
- [Links to any tickets created for test gaps]

## Related Sessions
- Planning: [link]
- Review: [link]
```

## After Review

Suggest next steps:
- `/plan:refine` - Create plan to address test gaps
- `/plan:tasks` - Create tickets for missing tests
- `/plan:breakdown` - Break down large testing efforts

## Arguments

"$ARGUMENTS" can specify:
- A file path to focus review
- A component/service name
- `--coverage-only` to skip quality review
- `--quality-only` to skip coverage analysis
