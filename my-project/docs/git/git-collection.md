| [Home](index.md) ▸ **Git** |
|-----|

# Git

A collection of helpful Git information for my future self.  For most information here is basic adding as my experience grows.  This is a mess and I need to reorg. change here

## Table of Contents <!-- omit in toc -->

- [Git](#git)
  - [Basics](#basics)
  - [Git Config](#git-config)
  - [Create New Repo](#create-new-repo)
    - [From Empty Directory](#from-empty-directory)
    - [From a Populated Directory](#from-a-populated-directory)
  - [Git Strategy Notes](#git-strategy-notes)
  - [Failing to delete remote branch](#failing-to-delete-remote-branch)
  - [Dealing with Branches](#dealing-with-branches)
  - [To add untracked files](#to-add-untracked-files)
  - [External cheat sheets](#external-cheat-sheets)
  - [Tagging](#tagging)
    - [Tagging past commit points](#tagging-past-commit-points)
  - [Merging a feature branch into main](#merging-a-feature-branch-into-main)
    - [Dealing with Merge Issues](#dealing-with-merge-issues)
  - [Undoing Stuff](#undoing-stuff)
    - [To revert the last commit when it has already been pushed up](#to-revert-the-last-commit-when-it-has-already-been-pushed-up)
  - [Renaming a branch](#renaming-a-branch)
  - [Versioning](#versioning)
  - [Commits](#commits)
  - [Set git Configuration](#set-git-configuration)
  - [Renaming a Repository](#renaming-a-repository)
  - [Misc Tips and Tricks](#misc-tips-and-tricks)
  - [Checking out a Repo Branch tracked on remote (like your buddy’s branch)](#checking-out-a-repo-branch-tracked-on-remote-like-your-buddys-branch)
  - [Personal Access Token](#personal-access-token)
  - [Personal Access Token per repo (to operate using VSCode with a container)](#personal-access-token-per-repo-to-operate-using-vscode-with-a-container)
  - [Squash](#squash)
    - [Squash Commits for a Feature into Main/main](#squash-commits-for-a-feature-into-mainmain)
    - [Squash Commits on a branch](#squash-commits-on-a-branch)
  - [Create New Repo from Populated Directory](#create-new-repo-from-populated-directory)
  - [Changing to a new branch name when branch has been pushed to remote](#changing-to-a-new-branch-name-when-branch-has-been-pushed-to-remote)


## Basics

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

## Git Config

* List git config : `git  config --list`
* Changing git config
  * If using GitHub desktop some values may be filled in
  * Can set git config to be global but may also find it beneficial to modify values to be repo specific.  Repo specific values override global values.
  * To set values globally use the --global flag
  * Set global username: `git config --global user.name "FIRST_NAME LAST_NAME"`
  * Set global email: `git config --global user.email "MY_NAME@example.com"`
  * Set local repo email: git config user.name "MY_NAME@example.com"
  * 

## Create New Repo

  ### From Empty Directory
  * Create directory to contain the project
  * `cd` into the root project directory
  * `git init`
  * Perform code dev with git commits.

  ### From a Populated Directory

  * `cd' into root of the populated prject directory to initialize as repo 
  * If the directory is a cloned repo you will need to change the origin:  ‘git remote set-url origin `<url>`”
  * If you the directory is an un initialized repo: `git init`
  * Add files to commit: `git add .`
  * Commit: `git commit -m “my first commit”`
  * If this is a newly initialized repo you will need to set the origin: ‘get remote add origin `<url>`”
  * Change the main branch to the new default: `git branch -M main`
  * Push the repo to remote repository: `git push -u origin main`

## Git Strategy Notes

A great recipe for Git branching model here: https://nvie.com/posts/a-successful-git-branching-model/

## Failing to delete remote branch

![Screenshot](Internal-Server-Error.png)

* Not sure how I got into the state shown above.  I could not delete the branch directly on GitHub GUI either
* Explanation of fetch -p option is that it tells fetch to delete any tracking branches that no longer exist in the corresponding remotes; by default they are kept around
* Option 1 to delete remote branch: `get push origin —delete <branchname>`
* Option 2 to delete remote branch:
  * `git fetch -p origin`
  * `git branch -r -d origin/<branchname>`
* I used what is shown in image above to ultimately delete

## Dealing with Branches

* List local branches: `git branch`
* To see latest remote branches in subsequent commands: `git fetch`
* List both local and remote branches: `git branch -a`
* List remote branches: `git branch -r`
* To checkout remote branch just do a simple checkout: `git checkout <branchname>`
* To create and checkout branch with one command: `git checkout -b <branchname>`
* To delete local branch: `git branch -d <branchname>`
* To delete remote branch: `git push origin -d <branchname>`
* When the `git branch -a` shows branches that do not exist on the remote use `git fetch —prune` to update the list.
* Take a single commit and reuse it into your working branch: `git cherry-pick <commit>`

## To add untracked files

* To add all changed files: git add .
* To add all changed files in directory: git add `<dirpath>`
* To add a changed file: git add `<filepathandname>`

## External cheat sheets

* https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf

## Tagging

Depending on needs tagging can be used to take a snapshot at a milestone(release).  The Snapshot could also include artifacts as needed.

* Use annotated tags
* Create tag: git tag -a `<tagname>` -m `<msg>`
* Show single tag: git shot `<tagname>`
* Show all tags: git tag -l
* Show tags with filter: git tag -l ‘v*’
* Push a single tag: git push origin `<tagname>`
* Push all tags: git push origin —tags
* Delete a tag: git tag -d `<tagname>`
* Delete remote tag: git push origin —delete `<tagname>`
* Can check out a tag but not recommended to commit because commit will be unreachable.  Best to make a new branch from tag: git checkout -b `<branchname>` `<tagname>` but be careful because branch will be slightly ahead of tag.
* Obtain most recent tag without the hexidecimal: git describe --tags --abbrev=0
* To obtain tag that points at this commit: git tag -l —points-at HEAD
* Can also use the following to obtain this commits tag: git tag —points-at
* Can view the latest tag via: git describe

### Tagging past commit points

* To list out past commits: git log —pretty=oneline
* To tag past commit point: git tag -a `<tagname>` `<commit point>` -m `<msg>`push

## Merging a feature branch into main

The git strategy should be agreed upon by all.  Recent experience is to mange the merges via pull requests and protect the main branch.

* Move to main branch: git checkout main
* Pull in latest from main: git pull
* Merge branch into main: git merge —no-ff `<branchname>`
  * The —no-ff merges the branch without a fast forward
  * A fast-forward is when constructing a merge commit, give just moves your branch pointer to the point at the incoming commit
  * The —no-ff is a always constructs a commit to perform the merge
  * The pro to using no-ff is that the explicit merge marker with names of the author and merger is present
  * The con of using no-ff is that it looks like a set of converging railroad tracks
  * To exit without saving :q!
* Push merged branch to origin: git push
* To mark with annotated tag this point in time: git tag -a v0.0.9 -m “Version v0.0.9”
* List all tags: git tag -l -n10  where the -n shows the notation
* To push tag to remote/origin: git push —tags. <- this pushes all tags
* Delete the temporary branch locally: git branch -d `<branchname>`
* Delete the temporary branch remotely: git push -d origin `<branchname>`

### Dealing with Merge Issues

* Scenario: adding a branch that is already present in upstream with the same file
  * Initial add not knowing the branch already existed: git push -u origin branch_name
    * Rejected because tip of your current branch is behind its remote counterpart.  Merge the remote changes (‘git pull’)
  * Did a ‘git pull origin branch_name’
    * Merge conflict with file_name
  * For this particular scenario merge tool was not installed to use
  * Added my file to overwrite the older file: git add filename
  * Commit the change
  * Did a push

## Undoing Stuff

* To reset to the Head: :git reset —hard HEAD && git clean -df
* The git clean command removes untracked files
* Undo the last commit: git reset —soft HEAD~1

### To revert the last commit when it has already been pushed up

* Assumption is that only want to go back one commit
* Do a ‘git revert HEAD’ to undo last commit
* Then push it up
* Git history will show the revert was performed

## Renaming a branch

* Option A
  * 1) If on the branch you want to rename: git branch -m new-name
  * 1) f on a different branch: git branch -m old-name new-name
  * 2) Delete the old-name remote branch and push the new-name local branch: git push origin :old-name new-name
  * 3) Reset the upstream branch for the new-name local branch: git push origin -u new-name
* Faster Option B
  * 1) Rename branch locally: git branch -m old-name new-name
  * 2) Delete the old branch: git push origin :old_branch
  * 3) Push the new branch, set local branch to track the new remote: git push —set-upstream origin new_branch
* Renaming both local and remote branch
  * Rename locally: git branch -m <old_name> <new_name>
  * Change name on remote: git push origin —delete <old_name>
  * Prevent git from using the old name when pushing in the next step.  Otherwise, git will use the old upstream name instead of the new_name: git branch —unset-upstream <new_name>
  * Push the new branch to the remote: git push `<remote>` <new_name>
  * Reset the upstream branch for the new_name local branch
  * Git push `<remote>` -u <new_name>

## Versioning

I may be more of a fan if versioning is required to version basd on the year and carry it out from there.  Maybe include the month, day, and possibly the build for that day.  idk but seems easier to know at a glance what the version actually is.  Gain should be agreed upon my the team.

* 2 types of versioning schemes
  * Internal version number: this can be incremented many times in a day (revision control number)
  * Released Version: changes less often
  * Semantic versioning: [major].[minor].[patch] - [build/beta/rc]
    * Major - big changes like backward-incompatibility
    * Minor - incremental if backward-compatible changes introduced
    * Patch - bug fix
* Version by tags: git tag -a “v1.5.0-beta” -m “version v1.5.0-beta”
* Released version should be managed by you
* Git tags can be the ‘true’ version of the application

## Commits

* Listing commits: git log

## Set git Configuration

* To list the current configuration: git config -l
* To  set user information:
  * cmd: git config —global user.name “gliverm”
  * Cmd: git config —global user.email gayle.livermore@gmail.com

## Renaming a Repository

* On Github (basics)
  * Navigate to the repo settings to change
  * All git clone/fetch/push operations will targeting the previous location will continue to function as if on new location.
  * To reduce confusion update the git config in local clones: git remote set-url origin <new_url>

## Misc Tips and Tricks

* How to download a single file from a GitHub repo: wget `<file url>`
* FYI GitHub has a CLI

## Checking out a Repo Branch tracked on remote (like your buddy’s branch)

* Fetch the remote branch information: git fetch origin
* To list branches on the remote: git branch -r
* Another option to list branches on the remote: git branch —remotes
* Can check out branch prefacing the remote name: git checkout -t origin/branchname



## Personal Access Token

* Create a personal access token(PAT) by going into github.com, user, settings, developer
* Copy the PAT and keep it somewhere safe
* Git uses the macOS key chain to keep credentials.  Got to the spotlight type in ‘Keychain access’
* Search for GitHub.com
* For the Internet login change it to use the new PAT
* From then on the HTTP PUSH will use the PAT

## Personal Access Token per repo (to operate using VSCode with a container)

* Create a personal access token(PAT) by going into github.com, settings->Developer Settings->Personal access tokens
* At repo root directory set remote url with format:  git remote set-url https://username:token@github.com/`<org>`/repository.git

## Squash

### Squash Commits for a Feature into Main/main

* Checkout main: git checkout main
* Do a git merge squashing in your branch: git merge —squash `<branch to merge in>`
* A message should come up with a merge message - accept
* Push it up

### Squash Commits on a branch

* Squashing is a way to rewrite the commit history, a way to clean up commit history before sharing work into a parent commit
* $:git checkout feature_branch
* Reset al the extra commits in your feature_branch but without changing any of your files locally.  $:git reset —soft main
* $:git add .
* $:git commit -m “Commit message”

## Create New Repo from Populated Directory

* Steps to create a new repo from a populated directory on your machine.
* Backup the directory just in case: cp -r `<dirname>` `<dirname>`-backup
* ‘cd’ to the root of the directory
* Initialize the directory as a git repo: git init
* Add all files to the tracked files: git add .
* Commit tracked files to the local copy: git commit -m `<msg>`
* Change the ‘main’ branch to something that makes sense for your project: git branch -M main
* Create the remote repo via the web interface or GitHub CLI
* Add the remote URL to the local repo copy: git remote set-url origin `<remote-repo-url>`  To verify the ULR set use ‘git remote -v’
* After this I did not document as well as I should have:
  * Set the main branch in the local copy to track to the main branch in the remote: ‘git branch —set-upstream-to=origin/main main’.  I’m not sure if this setting was really needed or not.
  * Update with a ‘git pull’.  This command showed that the local and remote ‘main’ branches were diverged
  * Did the following to merge the 2 branches together ‘git pull —ff-only’ but that failed.
  * Tried the following ‘git pull —rebase=true’ which seamed to have worked.
  * Finally do a ‘git push’ and Bob’s your uncle.
  * Not sure if correct strategy but since only working with the main branch and not a feature branch may be good to do.  Tutorial I found here: https://www.atlassian.com/git/tutorials/merging-vs-rebasing

## Changing to a new branch name when branch has been pushed to remote

* Rename local: git branch -m `<newname>`
* Delete old name on remote: git push origin —delete `<oldname>`  OR  git push origin :`<oldname>`
* Prevent git from using old name when pushing: git branch —unset-upstream `<newname>`
* Reset the upstream branch for the new name in the local branch: git push —set-upstream origin `<newname>`

Changing from main to Main

* Step 1:
  * Use ‘git branch -a’ to see main branch
    * Sidebar . . . if you see branches that have been long deleted it is because the git fetch (git pull) does not prune delete remote branches.  To remove them do a ‘git fetch -p’.
  * Move the main branch to ‘main’: git branch -m main main
  * Use ‘git branch -a’ to see main has been changed to main
* Step 2:
  * Push ‘main’ to remote repo: git push -u origin main
  * Use ‘git branch -a’ to see main branch has been pushed to remote
* Step 3:
  * Point HEAD to ‘main’ branch: git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/main
  * Using ‘git branch -a’ at this point to see the link from HEAD to origin/main
* Step 4:
  * Change default branch to ‘main’ on the GitHub: settings -> Branches
  * Don’t use the pencil to rename but change the with the arrows
* Step 5:
  * Delete ‘main’ branch on the remote repo: git push origin —delete main
  * Using ‘git branch -a’ shows main no longer present
* Note: To set machine to always initialize git branch with main: git config —global init.defaultBranch main

Duplicating a GitHub repo with history

1. Create a new repo in github using UI/command as usual. This will be the target repo where duplicate of source repo to be pasted.
2. Open a command prompt and Clone the source/existing repo using the command:
3. git clone --bare https://sourceRepoURL
4. A new folder will be created containing some files from source repo.
5. Move to that folder:cd sourceRepoFolder
6. Push these files into the target repo using command:git push --mirror https://targetRepoURL
