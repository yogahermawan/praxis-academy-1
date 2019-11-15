### Clone git
```
$ git clone git@github.com:Fourthten/rhymes.git rhymes
Cloning into 'rhymes'...
remote: Enumerating objects: 26, done.
remote: Counting objects: 100% (26/26), done.
remote: Compressing objects: 100% (19/19), done.
remote: Total 26 (delta 7), reused 23 (delta 4), pack-reused 0
Receiving objects: 100% (26/26), done.
Resolving deltas: 100% (7/7), done.
$ cd rhymes
```
### Change branch
```
$ git checkout -b readme
Switched to a new branch 'readme'
```
### Add, commit branch
```
$ git add .
$ git commit -m "information added in readme"
[new 3accfb6] information added in readme
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 readme.md
$ git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
```
### Check branch, remote
```
$ git branch
* master
  readme
$ git remote -v
origin  git@github.com:Fourthten/rhymes.git (fetch)
origin  git@github.com:Fourthten/rhymes.git (push)
```
### Push branch
```
$ git push origin readme
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 4 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 277 bytes | 138.00 KiB/s, done.
Total 3 (delta 1), reused 1 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
remote:
remote: Create a pull request for 'readme' on GitHub by visiting:
remote:      https://github.com/Fourthten/rhymes/pull/new/readme
remote:
To github.com:Fourthten/rhymes.git
 * [new branch]      readme -> readme

$ git add .
$ git commit -m "corrected url. fixes #1"
[master 3b64f49] corrected url. fixes #1
 1 file changed, 1 insertion(+), 1 deletion(-)
$ git push origin master
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 4 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 283 bytes | 94.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:Fourthten/rhymes.git
   43582f1..3b64f49  master -> master
```
### Organization 
![Organization](https://github.com/Fourthten/rhymes/blob/master/images/organization.png)
### Fork 
![Fork](https://github.com/Fourthten/rhymes/blob/master/images/fork.png)
### Issue 
![Issue](https://github.com/Fourthten/rhymes/blob/master/images/issue.png)
### Team 
![Team](https://github.com/Fourthten/rhymes/blob/master/images/team.png)
### Collaborators 
![Collaborators](https://github.com/Fourthten/rhymes/blob/master/images/collaborators.png)

