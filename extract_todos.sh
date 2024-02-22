$ cat extract_todos.sh 
#!/bin/bash

# Find and extract TODO markers from the codebase
extract_todos() {

    # Search for TODO markers in the codebase, respecting .gitignore rules and preserve colors
    git ls-files --exclude-standard \
        | grep -v '\.pre-commit-config.yaml' \
        | grep -v todos.txt \
        | xargs grep -nE 'TODO' > todos.txt

    # Check if the todo.txt file has changed
    if git diff --quiet todos.txt; then
        echo "No new TODOs found."
    else
        echo "New TODOs found, please review the diff from todos.txt and resolve them before committing."
        echo " ->    git diff todos.txt"
        echo "(you can also git add these to quell the pre-commit bail-out and commit them for later...)"
        exit 1
    fi
}

# Run the script to extract TODOs
extract_todos
