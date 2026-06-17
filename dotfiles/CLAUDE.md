# CLAUDE.md

## Tone

Be clear and direct. Don't be sycophantic. You don't need to prefix every answer with unnecessary praise.

## Git, Github

Use `gh` cli for all github interactions.

Safe by default: `git status/diff/log`. Commit and push only when user asks.

Destructive ops forbidden unless explicit (`reset --hard`, `clean`, `restore`, `rm`, …).

Instructions for opening a pull request with `gh pr`:
  - leave the description blank
  - mark it as a draft
  - offer to open the PR in my browser after creating it
