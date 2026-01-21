#!/bin/bash

# Linear project name (default: "this" to reference current directory)
PROJECT_NAME="${1:-this}"

while true; do
    echo "$(date): Starting claude task for project: $PROJECT_NAME..."
    claude --dangerously-skip-permissions -p "finish in progress task or pick up a new Linear task for $PROJECT_NAME project"
    echo "$(date): Task completed. Sleeping for 5 minutes..."
    sleep 300
done
