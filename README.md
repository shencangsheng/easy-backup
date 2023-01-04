# Increment Backup: full/incremental backup tool script

English | [简体中文](./i18n/README.zh-cn.md)

## Trying

### Linux

Run Dependencies

- `/bin/bash`
- `getopts`
- `tar`

Supported Backends

- Ubuntu >= 16.04
- Centos >= 6
- Alpine >= 3.7
- Debian <font color=red>Not tested</font>

This is a script to generate a full/incremental backup, use [tar snapshot](https://www.gnu.org/software/tar/manual/html_node/Incremental-Dumps.html) realization

```shell
bash backup-snapshot.sh -h
```

Restore backup, execute the full amount first and then execute the incremental backup file sequentially

```shell
tar --listed-incremental=${backup_exec_path}/${backup_file_name}-snapshot -zxf ${backup_exec_path}/${backup_target_file}_full.tar.gz
tar --listed-incremental=${backup_exec_path}/${backup_file_name}-snapshot -zxf ${backup_exec_path}/${backup_target_file}_incremental_${current_date}.tar.gz
```

## License

A short snippet describing the license (MIT)

MIT © Cangsheng Shen
