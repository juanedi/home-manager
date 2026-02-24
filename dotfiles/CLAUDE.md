# CLAUDE.md

<!-- drawing some inspiration from nateberkopec/dotfiles -->

## Git, Github

Use `gh` cli for all github interactions.

Safe by default: `git status/diff/log`. Commit and push only when user asks.

Destructive ops forbidden unless explicit (`reset --hard`, `clean`, `restore`, `rm`, …).

Instructions for opening a pull request with `gh pr`:
  - leave the description blank
  - mark it as a draft
  - offer to open the PR in my browser after creating it
