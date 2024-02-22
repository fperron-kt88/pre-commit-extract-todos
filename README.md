# pre-commit-extract-todos

Extract todos into a todos.txt file.

You will then have to fix them in the source or "git add todos.txt" and commit them for later.

### Using extract_todos with pre-commit

Add this to your `.pre-commit-config.yaml`:

```
repos:
  - repo: https://github.com/fperron-kt88/pre-commit-extract-todos
    rev: <specify_a_revision_if_needed>
    hooks:
      - id: extract-todos
        name: Extract TODOs
        entry: extract_todos.sh
        language: script
        types: [text]
```
