# git-show-branch-info

A simple utility script that displays detailed information about the current Git branch.

## Description

This script provides a quick overview of your current branch status, including:
- Current branch name
- Tracking branch information
- Commits ahead/behind the tracking branch
- Latest commit information

## Usage

```bash
./git-show-branch-info.sh
```

or copy it to your PATH and make it available as:

```bash
git show-branch-info
```

## Example Output

```
Current branch: feature-branch
Tracking: origin/feature-branch
Status: 2 commit(s) ahead, 0 commit(s) behind

Latest commit:
abc1234 (HEAD -> feature-branch) Add new feature
```

## Installation

1. Copy the script to a directory in your PATH:
   ```bash
   cp git-show-branch-info.sh /usr/local/bin/git-show-branch-info
   chmod +x /usr/local/bin/git-show-branch-info
   ```

2. Or use it directly from the contrib directory:
   ```bash
   ./contrib/git-show-branch-info/git-show-branch-info.sh
   ```

## Requirements

- Git 2.0 or later
- Standard Unix shell utilities (sh, cut)

## Author

Contributed to the Git project as a utility script for branch information display.
