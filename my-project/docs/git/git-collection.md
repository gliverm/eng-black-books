# Git

A collection of helpful Git information for my future self

## Basic

* To see current tracked and untracked files: `git status`
* Add all files to the index: `git add —all`
* Add a single file to the index: `git all <filename>`
* Remove files from working tree and from the index: `git —cached rm <filename-or-pattern>`  Files are NOT removed from working directory.  This comes in handy if you’re gitignore was doing what you thought it was suppose to be doing.  Use the ‘-r’ flag for recursive removals.
* Commit the changes: `git commit -m <change_description>`
* To list branches: `git branch`
* To delete local branch: `git branch -d <branchname>`
* To create a new local branch: `git branch <branchname>`
* To switch to the local branch: `git checkout <branchname>`
* To switch to a remote branch: `git checkout —track origin/<branchname>`
* To delete remote branch: `git push —delete <remotename> <branchname>`
* To push local branch to remote: `git push -u origin <branchname>`
* List all branches(local and remote): `git branch -a`

## Git Strategy Notes

A great recipe for Git branching model here: https://nvie.com/posts/a-successful-git-branching-model/

## Failing to delete remote branch

![Screenshot](Internal-Server-Error.png)

* Not sure how I got into the state shown above.  I could not delete the branch directly on GitHub GUI either
* Explanation of fetch -p option is that it tells fetch to delete any tracking branches that no longer exist in the corresponding remotes; by default they are kept around
* Option 1 to delete remote branch: get push origin —delete `<branchname>`
* Option 2 to delete remote branch:
  * :git fetch -p origin
  * :git branch -r -d origin/`<branchname>`
* I used what is shown in image above to ultimately delete
