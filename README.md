# git-xcp 

[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/vsouza/awesome-ios#tools)
[![Stories in Ready](https://badge.waffle.io/metasmile/git-xcp.svg?label=ready&title=Tasks)](http://waffle.io/metasmile/git-xcp)

The most simplest, safe, and fully automatic git plugin for versioning workflow of real-world xcode projects. Current working or draft content(unstaged, untracked or uncommitted files) is safe from conflict or loss.

![flow](https://raw.githubusercontent.com/metasmile/git-xcp/master/git-xcp.png?v=5)

# Install

```
$ (sudo) make install
```

# Usage
```
git xcp <command> [option]

commands:
	beta <project target> [option]
						--same-build
						--revert
	submit <project target>
	archive <project target>
	new <project target> <version>
```

# Commands
## beta

Push to branch 'release-beta' with automatically increment build number, and create tag.(MyApp/beta/b{CFBundleVersion})
```
$ git xcp beta MyApp
```

Performs with same build number
```
$ git xcp beta MyApp --same-build
```

Remove already created tags, add a reverse commit.
```
$ git xcp beta MyApp --revert
```

## submit

Create a tag '{scheme}/submit/{CFBundleShortVersionString}_b{CFBundleVersion}' from the lastest version(HEAD) automatically to manage for additional changes, And deploy as a "release-submit" branch. Maybe you should run this script after succesfully submitted to AppStore review team.

```
$ git xcp submit MyApp
```

## archive

Squash merge, and push version of release onto 'master' branch via commit '[Release - MyApp - 1.0]', and creates a tag 'MyApp/1.0'"

```
$ git xcp archive MyApp
```

## new

If your app succesfully released AppStore, Let's start with new CFBundleShortVersionString.

```
$ git xcp new MyApp 1.1 (from 1.0)
```

## Make your own commands

Also, You can add your new subcommand. 'Makexcp' will automatically wrap general git tasks up.
 Let's create a source file to following path.

```
touch ./src/xcp-mycmd
```

edit 'xcp-mycmd'

```
# add your scripts here
```

And then,
```
$ ./Makexcp mycmd
```

It creates

```
./git-xcp-mycmd
```

And, you can contain it into git-xcp command.
Open 'Makefile', and add following lines.

```
...
install:
	./Makexcp beta
	./Makexcp submit
	./Makexcp archive
	./Makexcp new
    ./Makexcp mycmd <- your command was added.
...
```

Finally, Install them.
```
$ make install
```
