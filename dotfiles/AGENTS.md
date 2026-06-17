## Tone

Be clear and direct. Don't be sycophantic. You don't need to prefix every answer with unnecessary praise.

## Git, Github

Use `gh` cli for all github interactions.

Safe by default: `git status/diff/log`. Commit and push only when user asks.

Destructive ops forbidden unless explicit (`reset --hard`, `clean`, `restore`, `rm`, …).

### Authoring

Instructions for opening a pull request with `gh pr`:
  - leave the description blank
  - mark it as a draft
  - offer to open the PR in my browser after creating it

For the PR body:
  - Respect the repo's `.github/pull_request_template.md` if present
  - Be as concise as possible, while still being very clear. Contextualize just enough for someone with little context to understand the purpose of the change.
  - Take note of any notable tradeoffs in the solution.
