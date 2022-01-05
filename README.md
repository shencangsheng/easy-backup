# Universal Tools: general open source tool library, covering a variety of scripting tools.

English | [简体中文](./i18n/README.zh-cn.md)

## Trying Universal Tools

### Linux

#### full/incremental backup tool script

Run Dependencies
* `/bin/bash`
* `getopts`
* `tar`

Supported Backends
* Ubuntu >= 16.04
* Centos >= 6
* Alpine >= 3.7
* Debian <font color=red>Not tested</font>

This is a script to generate a full/incremental backup, use [tar snapshot](https://www.gnu.org/software/tar/manual/html_node/Incremental-Dumps.html) realization

```shell
bash backup-snapshot.sh -h
```