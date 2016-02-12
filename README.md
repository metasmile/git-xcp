# git-xcp

The most simplest, safe, and config zero git pipelines, xcp lets you manage version of your Xcode project without currently working content. Safe from conflict or loss.

# xcpd

Push to branch 'release-beta' with automatically increment build number, and create tag.(b/{buildNumber})

```
~/YOUR_PROJECT$ xcpd
```

# xcpa

Squash merge, and push version of release onto master branch from specific tag.

```
~/YOUR_PROJECT$ xcpa {tag name of release version}

ex) ~/YOUR_PROJECT$ xcpa 1.0
```

# xcpn

If your app succesfully released AppStore, Let's start with new CFBundleShortVersionString.

```
~/YOUR_PROJECT$ xcpn {target name} {new version name}

ex) ~/YOUR_PROJECT$ xcpn project1 1.1
```

# xcps

xcps create a tag from the lastest version(HEAD) automatically to manage for additional changes. And deploy as a "release-submit" branch. Maybe you should run this script after succesfully submitted to AppStore review team.

```
~/YOUR_PROJECT$ xcps {target name}

ex) ~/YOUR_PROJECT$ xcps projectname
```

# xcpmake

Add your new git tasks and create. xcpmake will automatically wrap general git tasks up.

## Make your own source script
example filename : xcpexample-src

```
# your git commands are here.
```

## And then
```
~/YOUR_PROJECT$ xcpmake {source script file name} {file name to create}

ex) ~/YOUR_PROJECT$ xcpmake xcpexample-src xcpex
```

Or, you can test with shaped like below.

```
source $(dirname $0)/xcp-begin
# your git commands are here.
source $(dirname $0)/xcp-end
```

# If and when it throw any error..

Simply just do below.
```
~/YOUR_PROJECT$ git stash pop
```
