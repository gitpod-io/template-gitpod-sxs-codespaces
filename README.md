# template-gitpod-sxs-codespaces

A template that demonstrates how to have an isomorphic developer environments between Gitpod and GitHub Codespaces.

Inside this repository is a simple hello world rust application which prints the name of the workspace.

## Detecting if Gitpod or Codespaces

Refer to the [Makefile](./Makefile) which tests for the existence of the environment variables `GITPOD_WORKSPACE_ID` and `CODESPACE_NAME`.

## Pre-compiling

On Gitpod this repository loads in a blink by prebuilding the project ahead-of-time, continuously.

This behavior is configured via the `init` stanza in [.gitpod.yml](./gitpod.yml). Refer to https://www.gitpod.io/screencasts/continuously-prebuild-your-project for more information about this feature.

GitHub Codespaces does not support pre-compiling projects.

## Startup tasks


### Gitpod

The commands which are executed on startup are defined at the `command` stanza within [.gitpod.yml](./gitpod.yml).

Refer to https://www.gitpod.io/docs/references/gitpod-yml for more information.

### GitHub Codespaces

The commands which are executed on startup are defined at `"postCreateCommand"` within [.devcontainer/devcontainer.json](.devcontainer/devcontainer.json).
    
Refer to https://code.visualstudio.com/docs/remote/devcontainerjson-reference for more information.


## VSCode Extensions

It would be great to see a unification effort to remove duplication of boilerplate but for now there are three places where extensions need to be defined:

- [.gitpod.yml](./gitpod.yml)
- [.vscode/extensions.json](.vscode/extensions.json)
- [.devcontainer/devcontainer.json](.devcontainer/devcontainer.json)

Refer to the following for more insights:
- https://www.gitpod.io/docs/vscode-extensions
- https://code.visualstudio.com/docs/editor/extension-marketplace
- https://code.visualstudio.com/docs/remote/devcontainerjson-reference

## Docker

The same Docker image ([.gitpod.Dockerfile](.gitpod.Dockerfile)) is used on both Gitpod and GitHub Codespaces. In this repository the default Gitpod workspace image ([workspace-full](https://github.com/gitpod-io/workspace-images/tree/master/full)) is used for simplicity but you can use any Ubuntu based container on either platform.

On Gitpod you need to have a user named `gitpod` with the following permissions:

```
uid=33333(gitpod) gid=33333(gitpod) groups=33333(gitpod)
```

For GitHub Codespaces interop you'll need to configure the `"remoteUser"` stanza in [.devcontainer/devcontainer.json](.devcontainer/devcontainer.json) to be `gitpod`.


Refer to the base Gitpod image ([workspace-base](https://github.com/gitpod-io/workspace-images)) for insights how this user is created. If the default workspace image ([workspace-full](https://github.com/gitpod-io/workspace-images/tree/master/full)) isn't to your taste then deriving from [workspace-base](https://github.com/gitpod-io/workspace-images) usually a better idea than rolling your own image from scratch.

The Docker image interop between GitHub Codespaces is done via:
- [.gitpod.yml](./gitpod.yml)
- `"dockerfile"` within [.devcontainer/devcontainer.json](.devcontainer/devcontainer.json)

Refer to https://code.visualstudio.com/docs/remote/devcontainerjson-reference and https://www.gitpod.io/docs/references/gitpod-yml for more information.
