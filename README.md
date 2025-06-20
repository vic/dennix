<!-- NOTICE: edit this file at dev/README.md -->
# dennix - Community-driven Nix distribution based on the Dendritic pattern.

> We are trying to make NixOS accessible for more people. And give them specialized configurations (desktop-rices, games, ai/dev environments). All of them in an instant: Just add water!.

The `dennix` project aims to provide community-driven configuration distributions
for nix module classes: `nixos`/`nix-darwin`/`home-manager`/`nixos-wsl`/etc.

On editor configuration frameworks like those for neovim/spacemacs, you can enable 
or disable different _layers_ (collections of features) and have a fully working environment
in no time. Have them maintained and pre-configured by the community for you, 
while also allowing you to add custom or private configurations. 

In the same spirit, `dennix` provides pre-configured flake-parts module collections
that you can mixin into your own configs. The only requirement is to follow the 
[Dendritic](https://github.com/mightyiam/dendritic) configuration pattern: each file
is a flake-parts module that configures a feature across different nix module classes.

## Quick Start

We provide some [templates](https://github.com/vic/dennix/tree/main/templates) you can
use to start a new flake.

```
nix flake init github:vic/dennix#template
```

Then edit your [`layers.nix`](https://github.com/vic/dennix/tree/main/templates/default/layers.nix) file.

### Try it Online! 

If you are not currently a NixOS user, you can try 
running an ephemereal NixOS on the web.

- Go to [Distrosea nixos-unstable-minimal](https://distrosea.com/start/nixos-unstable-minimal/)

Start a machine and run the following:

```shell
nix run .#os-switch template
```


## How it works

This repo is mostly a collection of (with your help) well organized cross-cutting concerns configurations.
Read the documentation at [flake.nix](https://github.com/vic/dennix/tree/main/flake.nix).

> tl;dr. By sharing import-tree subtrees of flake-modules on this repo.

```nix
  # Each collection has a category and name, and is loaded by import-tree from 
  #
  #    ./modules/<category>/<name>/**.nix
  #
  # and exposed on the flake as a single module:
  #
  #    modules.${category}.${name}
  #
  #
  # <category>/<name> provides a namespace for organizing content
  # by their purpose, eg, "layer/kde" or "vix/kde" where the
  # first is intended to be totally generic and the second vendor opinionated.
  # both of these example kde layers can contribute to `modules.nixos.kde`.
```

## Customization

Once you have a `./modules/` directory on your flake, just add flake-parts modules following the dendritic pattern.
All files will be loaded automatically. Edit your `layers.nix` to include dennix provided features you choose.

## Advanced usage

On `layers.nix` you can use `import-tree` to enable a custom set of directories from ./modules.

```nix
import-tree "${inputs.dennix}/modules/vix" # all configurations vendored by vix.
```

## List of available layers.

TODO: Use mightyiam/files to generate a list of _category/name_ layers from ./modules

## FAQ

- Are these configurations restriced to dendritic setups?

  Yes. The reason is that using dendritic patterns allows
  you to easily mix and reorganize layers because
  *all nix files are loaded unconditionally* (using [vic/import-tree](https://github.com/vic/import-tree)).

  Layers (configurations presets) are always loaded and available
  but only *enabled* when you include them as part of top-level module of yours.

- Is dennix a NixOS based distribution ?

  In a way, but we still don't provide customized bootable installers.

  It is more a flake-parts configurations collection that can be included
  on any dendritic setup.

- Can I contribute my _awesome Desktop_ rice?

  Sure, as long as you also volunteer to keep it maintained and up to date.

  You can share your awesome desktop configuration as long as it is usable and attractive
  enough for other people.

- How about Games/AI/Devops/Security layers?

  You are right on point!, that's precisely why this project started. We also
  want to provide specialized versions of NixOS focused on pre-configured security, gaming,
  development setups.

## Contributing

Since we all now have agreed to follow the Dendritic
pattern to organize our files, lets take a few more guidelines to make eveybody's life easier:

- Always be nice, and have respect for others.
- Be professional and considerate we are giving our time and energy on this project as an invaluable good for others.
- Contributions are welcome as long as you also make a compromise to become maintainer for your feature don't abandon your contribution easily. (Unmaintained files will be removed.)
- This is a community project, so as soon as your PR is merged you'll also get commit bit, however we restrict
  changes to be only via PRs and require code-owners review before merge.
- Prefer linear git history, squash PRs and no merge-commit. Vic recommends working with jujutsu.

