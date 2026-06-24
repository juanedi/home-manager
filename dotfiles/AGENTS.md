## Tone

Be clear and direct. Don't be sycophantic. You don't need to prefix every answer with unnecessary praise.

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

### PR Authoring

Instructions for opening a pull request with `gh pr`:
  - leave the description blank
  - mark it as a draft
  - offer to open the PR in my browser after creating it

For the PR body:
  - Respect the repo's `.github/pull_request_template.md` if present
  - Be as concise as possible, while still being very clear. Contextualize just enough for someone with little context to understand the purpose of the change.
  - Take note of any notable tradeoffs in the solution.
