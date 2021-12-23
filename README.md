![Workflow Status](https://img.shields.io/github/workflow/status/GZGavinZhao/setup-solbuild/Workflow%20CI)

Install and setup [`solbuild`](https://github.com/getsolus/solbuild), the Solus
package build system. Note that this does not automatically build the package
for you. It merely provide you with a ready-to-use `solbuild` tool. To build
your package, run `sudo solbuild build` in the same directory of your
`package.yml` file. For more details on how to build a package for Solus OS,
refer to articles on [packaging](https://getsol.us/articles/packaging/) in the
Solus Help Center.

**Note:** This is only guaranteed to work on Linux systems, and most `solbuild`
commands require you to run as root user.

## Inputs

### `packager`

Name of the packager. For details, see
[Building a package](https://getsol.us/articles/packaging/building-a-package/en/)
from the Solus docs. This field is not required, but if you plan to distribute
your package (either to the [official Solus repository](https://dev.getsol.us)
or to your own repo), it's strongly recommended you fill out this field (and the
`email` field below) for users to identify you and your package.

### `email`

Email of the packager. For details, see
[Building a package](https://getsol.us/articles/packaging/building-a-package/en/)
from the Solus docs.

### `profile`

The profile to initialize. Current available options are `unstable` (default) and
`main`. For details on when you need to use the `main` profile, consult [this](https://github.com/getsolus/solbuild/blob/master/data/main-x86_64.profile)
file from the `solbuild` repository.

If you want to initialize another profile, manually run
`sudo solbuild init -p <profile>-x86_64`.

## Example usage

```yaml
- uses: gzgavinzhao/setup-solbuild@v2
    with:
      packager: "Gavin Zhao"
      email: "gavin@example.com"
      profile: unstable

- name: 'Build package'
  run: sudo solbuild build # Run with sudo!
  shell: bash
```
