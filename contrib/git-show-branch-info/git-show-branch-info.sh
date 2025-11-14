#!/bin/sh
#
# git-show-branch-info - Display detailed information about the current branch
#
# This is a simple utility script that shows useful information about
# the current Git branch, including the branch name, tracking information,
# and commit count.
#

# Get the current branch name
branch=$(git symbolic-ref --short HEAD 2>/dev/null)

if [ -z "$branch" ]; then
    echo "Not currently on any branch (detached HEAD)"
    exit 1
fi

echo "Current branch: $branch"

# Get tracking branch information
tracking=$(git for-each-ref --format='%(upstream:short)' "refs/heads/$branch")

if [ -n "$tracking" ]; then
    echo "Tracking: $tracking"
    
    # Count commits ahead/behind
    ahead_behind=$(git rev-list --left-right --count "$tracking...$branch" 2>/dev/null)
    
    if [ -n "$ahead_behind" ]; then
        ahead=$(echo "$ahead_behind" | cut -f1)
        behind=$(echo "$ahead_behind" | cut -f2)
        
        if [ "$ahead" -gt 0 ] || [ "$behind" -gt 0 ]; then
            echo "Status: $ahead commit(s) ahead, $behind commit(s) behind"
        else
            echo "Status: up to date"
        fi
    fi
else
    echo "No tracking branch configured"
fi

# Show the latest commit
echo ""
echo "Latest commit:"
git log -1 --oneline --decorate
