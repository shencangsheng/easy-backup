# Increment Backup: 全量/增量备份工具脚本。

简体中文 | [English](https://github.com/shencangsheng/Increment-Backup)

## 尝试使用

### Linux

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

恢复备份，先执行全量再顺序执行增量备份文件
```shell
tar --listed-incremental=${backup_exec_path}/${backup_file_name}-snapshot -zxf ${backup_exec_path}/${backup_target_file}_full.tar.gz
tar --listed-incremental=${backup_exec_path}/${backup_file_name}-snapshot -zxf ${backup_exec_path}/${backup_target_file}_incremental_${current_date}.tar.gz
```
