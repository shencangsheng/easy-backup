# Universal Tools: 一个通用开源的工具库，涵盖多种脚本工具。

简体中文 | [English](http:)

## 尝试使用

### Linux

#### 全量/增量备份工具脚本

运行依赖工具
* `/bin/bash`
* `getopts`
* `tar`

支持发行版
* Ubuntu >= 16.04
* Centos >= 6
* Alpine >= 3.7
* Debian <font color=red>未测试</font>

这是一个全量/增量备份工具脚本, 使用 [tar snapshot](https://www.gnu.org/software/tar/manual/html_node/Incremental-Dumps.html) 实现

```shell
bash backup-snapshot.sh -h
```