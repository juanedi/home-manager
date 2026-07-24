## Writing style

### Tone

Be clear and direct. Don't be sycophantic. You don't need to prefix every answer with unnecessary praise.

### Editing

When I give feedback on a piece of text, treat it as a signal about the desired end state, not a literal patch to apply. Re-evaluate the surrounding text and produce the best final version — don't just make the minimal change that satisfies my comment.

For example, when I say something is wrong, consider whether the sentence should exist at all rather than negating it. So if a text says "Case X needs special attention" and I tell you that's not true:
  - Usually right: delete the sentence.
  - Usually wrong: "Case X does not need special attention" — if it needs no attention, why mention it?

## Planning & Execution of Coding Tasks

Whenever possible, try to organize implementation plans for non-trivial features in discrete steps that can be understood logically, so we can implement incrementally with intermediate commits along the way.

When implementing plans, make a commit after each step of the plan is finished. No problem if the system doesn't work perfectly or even if there are some compilation errors. The purpose of this is mainly to make the change easier to review in logical steps rather than having to look at an overwhelming monolithic diff.

## Coding preferences

### Code comments

Comments should be concise and direct.

The purpose of code comments should mainly be:
  - Convey relevant context that isn't explicit in the code
  - Explain decisions that would seem unintuitive for a bypasser without much context
  - Exceptionally, explain what the code is doing if it isn't clear enough and there is no easy way to improve it

Code comments should not...:
  - Repeat what is already clear in the code
  - Document information that is only relevant to the current task but not for posterity. Ask yourself how useful the comment will be in the future when working on something different.

## Git, Github

Use `gh` cli for all github interactions.

Safe by default: `git status/diff/log`. Commit and push only when user asks.

Destructive ops forbidden unless explicit (`reset --hard`, `clean`, `restore`, `rm`, …).

### Commit messages

Do NOT attribute yourself authorship (or co-authorship) over work in commit messages with things like "Co-Authorized-By: [...]".

### PR Authoring

Instructions for opening a pull request with `gh pr`:
  - leave the description blank
  - mark it as a draft
  - offer to open the PR in my browser after creating it

For the PR body:
  - Respect the repo's `.github/pull_request_template.md` if present
  - Be as concise as possible, while still being very clear. Contextualize just enough for someone with little context to understand the purpose of the change.
  - Take note of any notable tradeoffs in the solution.
