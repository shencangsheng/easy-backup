# Easy Backup

简体中文 | [English](https://github.com/shencangsheng/easy-backup)

`easy-backup` 是一个简单易用的`linux`文件全量/增量备份工具，支持按日增量/恢复数据

## 尝试使用

```bash
git clone https://github.com/shencangsheng/easy-backup.git
cd easy-backup
chmod +x easy-backup-cli
cp easy-backup-cli /usr/local/bin/
```

## 示例

1. 创建全量备份 `/example/backups/archive.tar.gz` `/example/backups/archive.snar`

```bash
easy-backup-cli --snapshot='backup' --action='full' --archive-dir='/example/archive' --output-path='/example/backups'
```

2. 创建增量备份 `/example/backups/archive-inc-yyyy-MM-dd.tar.gz`

```bash
easy-backup-cli --snapshot='backup' --action='inc' --archive-dir='/example/archive' --output-path='/example/backups'
```

3. 恢复快照 `/example/backups/archive.tar.gz` 到 `/example/restore/archive`

```bash
easy-backup-cli --snapshot='restore' --archive-file='/example/backups/archive.tar.gz' --output-path='/example/restore'
```

4. 恢复到 2024-02-01 的快照 `/example/restore/archive`

```bash
easy-backup-cli --snapshot='restore' --archive-file='/example/backups/archive.tar.gz' --output-path='/example/restore' --end-date='2024-02-01'
```

### Linux

运行依赖工具

- `/bin/bash`
- `getopts`
- `tar`

使用 [tar snapshot](https://www.gnu.org/software/tar/manual/html_node/Incremental-Dumps.html) 实现

```bash
easy-backup-cli --help-cn
```
