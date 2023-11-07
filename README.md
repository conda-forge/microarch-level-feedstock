About microarch-level-feedstock
===============================

Feedstock license: [BSD-3-Clause](https://github.com/conda-forge/microarch-level-feedstock/blob/main/LICENSE.txt)


About microarch-level
---------------------

Home: https://github.com/conda-forge/microarch-level-feedstock

Package license: BSD-3-Clause

Summary: Meta package to build conda recipes with microarchitecture levels

About _x86_64-microarch-level
-----------------------------

Home: https://github.com/conda-forge/microarch-level-feedstock

Package license: BSD-3-Clause

Summary: Meta package to build conda recipes with microarchitecture levels

The meta-package _x86_64-microarch-level enforces the microarchitecture in the
user system.

Note that a user would need the archspec conda package installed
in the base environment where conda/mamba is run from.

See x86_64-microarch-level for using this in conda recipes


About x86_64-microarch-level
----------------------------

Home: https://github.com/conda-forge/microarch-level-feedstock

Package license: BSD-3-Clause

Summary: Meta package to build conda recipes with microarchitecture levels

Use the meta-package x86_64-microarch-level in requirements/build in conda
recipes to set up the compiler flags and set up the virtual package
requirements in the run requirements.

When building packages on CI, level=4 will not be guaranteed, so
you can only use level<=3 to build.

The run_exports only has a lower bound and therefore a level=2
build can be installed on a level=3 user system. A tighter bound
is not added because we want to be able to test both level=2 and
level=3 on a CI machine with level=3.
Therefore in order to prioritise the highest level, use the build
number to prioritise the level.

Only supported on Linux and macOS.


About _ppc64le-microarch-level
------------------------------

Home: https://github.com/conda-forge/microarch-level-feedstock

Package license: BSD-3-Clause

Summary: Meta package to build conda recipes with microarchitecture levels

The meta-package _ppc64le-microarch-level enforces the microarchitecture in the
user system.

Note that a user would need the archspec conda package installed
in the base environment where conda/mamba is run from.

See ppc64le-microarch-level for using this in conda recipes


About ppc64le-microarch-level
-----------------------------

Home: https://github.com/conda-forge/microarch-level-feedstock

Package license: BSD-3-Clause

Summary: Meta package to build conda recipes with microarchitecture levels

Use the meta-package ppc64le-microarch-level in requirements/build in conda
recipes to set up the compiler flags and set up the virtual package
requirements in the run requirements.

When building packages on CI, level=4 will not be guaranteed, so
you can only use level<=3 to build.

The run_exports only has a lower bound and therefore a level=2
build can be installed on a level=3 user system. A tighter bound
is not added because we want to be able to test both level=2 and
level=3 on a CI machine with level=3.
Therefore in order to prioritise the highest level, use the build
number to prioritise the level.

Only supported on Linux and macOS.


Current build status
====================


<table><tr><td>All platforms:</td>
    <td>
      <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=20721&branchName=main">
        <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/microarch-level-feedstock?branchName=main">
      </a>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-_ppc64le--microarch--level-green.svg)](https://anaconda.org/conda-forge/_ppc64le-microarch-level) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/_ppc64le-microarch-level.svg)](https://anaconda.org/conda-forge/_ppc64le-microarch-level) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/_ppc64le-microarch-level.svg)](https://anaconda.org/conda-forge/_ppc64le-microarch-level) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/_ppc64le-microarch-level.svg)](https://anaconda.org/conda-forge/_ppc64le-microarch-level) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-_x86_64--microarch--level-green.svg)](https://anaconda.org/conda-forge/_x86_64-microarch-level) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/_x86_64-microarch-level.svg)](https://anaconda.org/conda-forge/_x86_64-microarch-level) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/_x86_64-microarch-level.svg)](https://anaconda.org/conda-forge/_x86_64-microarch-level) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/_x86_64-microarch-level.svg)](https://anaconda.org/conda-forge/_x86_64-microarch-level) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-ppc64le--microarch--level-green.svg)](https://anaconda.org/conda-forge/ppc64le-microarch-level) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/ppc64le-microarch-level.svg)](https://anaconda.org/conda-forge/ppc64le-microarch-level) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/ppc64le-microarch-level.svg)](https://anaconda.org/conda-forge/ppc64le-microarch-level) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/ppc64le-microarch-level.svg)](https://anaconda.org/conda-forge/ppc64le-microarch-level) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-x86_64--microarch--level-green.svg)](https://anaconda.org/conda-forge/x86_64-microarch-level) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/x86_64-microarch-level.svg)](https://anaconda.org/conda-forge/x86_64-microarch-level) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/x86_64-microarch-level.svg)](https://anaconda.org/conda-forge/x86_64-microarch-level) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/x86_64-microarch-level.svg)](https://anaconda.org/conda-forge/x86_64-microarch-level) |

Installing microarch-level
==========================

Installing `microarch-level` from the `conda-forge` channel can be achieved by adding `conda-forge` to your channels with:

```
conda config --add channels conda-forge
conda config --set channel_priority strict
```

Once the `conda-forge` channel has been enabled, `_ppc64le-microarch-level, _x86_64-microarch-level, ppc64le-microarch-level, x86_64-microarch-level` can be installed with `conda`:

```
conda install _ppc64le-microarch-level _x86_64-microarch-level ppc64le-microarch-level x86_64-microarch-level
```

or with `mamba`:

```
mamba install _ppc64le-microarch-level _x86_64-microarch-level ppc64le-microarch-level x86_64-microarch-level
```

It is possible to list all of the versions of `_ppc64le-microarch-level` available on your platform with `conda`:

```
conda search _ppc64le-microarch-level --channel conda-forge
```

or with `mamba`:

```
mamba search _ppc64le-microarch-level --channel conda-forge
```

Alternatively, `mamba repoquery` may provide more information:

```
# Search all versions available on your platform:
mamba repoquery search _ppc64le-microarch-level --channel conda-forge

# List packages depending on `_ppc64le-microarch-level`:
mamba repoquery whoneeds _ppc64le-microarch-level --channel conda-forge

# List dependencies of `_ppc64le-microarch-level`:
mamba repoquery depends _ppc64le-microarch-level --channel conda-forge
```


About conda-forge
=================

[![Powered by
NumFOCUS](https://img.shields.io/badge/powered%20by-NumFOCUS-orange.svg?style=flat&colorA=E1523D&colorB=007D8A)](https://numfocus.org)

conda-forge is a community-led conda channel of installable packages.
In order to provide high-quality builds, the process has been automated into the
conda-forge GitHub organization. The conda-forge organization contains one repository
for each of the installable packages. Such a repository is known as a *feedstock*.

A feedstock is made up of a conda recipe (the instructions on what and how to build
the package) and the necessary configurations for automatic building using freely
available continuous integration services. Thanks to the awesome service provided by
[Azure](https://azure.microsoft.com/en-us/services/devops/), [GitHub](https://github.com/),
[CircleCI](https://circleci.com/), [AppVeyor](https://www.appveyor.com/),
[Drone](https://cloud.drone.io/welcome), and [TravisCI](https://travis-ci.com/)
it is possible to build and upload installable packages to the
[conda-forge](https://anaconda.org/conda-forge) [Anaconda-Cloud](https://anaconda.org/)
channel for Linux, Windows and OSX respectively.

To manage the continuous integration and simplify feedstock maintenance
[conda-smithy](https://github.com/conda-forge/conda-smithy) has been developed.
Using the ``conda-forge.yml`` within this repository, it is possible to re-render all of
this feedstock's supporting files (e.g. the CI configuration files) with ``conda smithy rerender``.

For more information please check the [conda-forge documentation](https://conda-forge.org/docs/).

Terminology
===========

**feedstock** - the conda recipe (raw material), supporting scripts and CI configuration.

**conda-smithy** - the tool which helps orchestrate the feedstock.
                   Its primary use is in the construction of the CI ``.yml`` files
                   and simplify the management of *many* feedstocks.

**conda-forge** - the place where the feedstock and smithy live and work to
                  produce the finished article (built conda distributions)


Updating microarch-level-feedstock
==================================

If you would like to improve the microarch-level recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`conda-forge` channel, whereupon the built conda packages will be available for
everybody to install and use from the `conda-forge` channel.
Note that all branches in the conda-forge/microarch-level-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@isuruf](https://github.com/isuruf/)

