# renv: A Ruby Environment Context Switcher

|         |                                           |
| ------: | ----------------------------------------- |
|      CI | [![CI Status][badge-ci-overall]][ci]      |
| License | [![Crate license][badge-license]][github] |

**Table of Contents**

<!-- toc -->

- [About](#about)
- [Installation](#installation)
- [Usage](#usage)
  - [Activating renv in a project directory](#activating-renv-in-a-project-directory)
  - [Resetting the environment](#resetting-the-environment)
  - [Checking the status of the environment](#checking-the-status-of-the-environment)
- [Code of Conduct](#code-of-conduct)
- [Issues](#issues)
- [Contributing](#contributing)
- [Authors](#authors)
- [License](#license)

<!-- tocstop -->

## About

`renv` will help setup the appropriate system environment variables so that
RubyGems will be installed under the current directory in a `.gem` directory for
the currently used version of Ruby. The gem directory's `bin/` directory is also
added to `$PATH`. This is a reasonably simple way to help users install their
RubyGems locally and per-project or in a common directory for easier cleanup
later.

## Installation

`renv` is designed to be sourced when a new shell is loaded via `/etc/profile.d`
which will work for all users, system-wide. On most systems, this should work
(run as a root user or each command via `sudo`):

```sh
mkdir -p /etc/profile.d
curl -sSfL \
  https://raw.githubusercontent.com/fnichol/renv/master/renv.sh \
  -o /etc/profile.d/renv.sh
chmod 0644 /etc/profile.d/renv.sh
```

Alternatively, you can simply source a downloaded copy of `renv.sh` whenever you
need it, for example:

```
source ~/.renv.sh
```

## Usage

### Activating renv in a project directory

The default subcommand will set the appropriate system environment variables so
that gems will be installed to and read from under `./.gem` by default.

```console
$ renv
```

### Resetting the environment

To unset appropriate system environment variables and return to the state before
`renv` was run, use:

```console
$ renv reset
```

### Checking the status of the environment

To check the status of the appropriate system environment variables:

```console
$ renv status
```

## Code of Conduct

This project adheres to the Contributor Covenant [code of
conduct][code-of-conduct]. By participating, you are expected to uphold this
code. Please report unacceptable behavior to fnichol@nichol.ca.

## Issues

If you have any problems with or questions about this project, please contact us
through a [GitHub issue][issues].

## Contributing

You are invited to contribute to new features, fixes, or updates, large or
small; we are always thrilled to receive pull requests, and do our best to
process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub
issue][issues], especially for more ambitious contributions. This gives other
contributors a chance to point you in the right direction, give you feedback on
your design, and help you find out if someone else is working on the same thing.

## Authors

Created and maintained by [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>).

## License

Licensed under the MIT ([LICENSE.txt][license]).

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, shall be licensed as above, without any
additional terms or conditions.

[badge-ci-overall]:
  https://img.shields.io/cirrus/github/fnichol/renv?style=flat-square
[badge-license]: https://img.shields.io/badge/License-MIT-blue.svg
[ci]: https://cirrus-ci.com/github/fnichol/renv
[code-of-conduct]:
  https://github.com/fnichol/renv/blob/master/CODE_OF_CONDUCT.md
[fnichol]: https://github.com/fnichol
[github]: https://github.com/fnichol/renv
[issues]: https://github.com/fnichol/renv/issues
[license]: https://github.com/fnichol/renv/blob/master/LICENSE.txt
