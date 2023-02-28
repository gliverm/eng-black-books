# Git

A collection of helpful Git information for my future self

## Basic

* To see current tracked and untracked files: `git status`
* Add all files to the index: `git add —all`
* Add a single file to the index: `git all <filename>`
* Remove files from working tree and from the index: git —cached rm [filename or pattern].  Files are NOT removed from working directory.  This comes in handy if you’re gitignore was doing what you thought it was suppose to be doing.  Use the ‘-r’ flag for recursive removals.
* Commit the changes: `git commit -m <change_description>`
* To list branches: `git branch`
* To delete local branch: `git branch -d <branchname>`
* To create a new local branch: `git branch <branchname>`
* To switch to the local branch: `git checkout <branchname>`
* To switch to a remote branch: `git checkout —track origin/<branchname>'
* To delete remote branch: `git push —delete <remotename> <branchname>`
* To push local branch to remote: `git push -u origin <branchname>`
* List all branches(local and remote): `git branch -a`
