# Easy Backup

English | [简体中文](./i18n/README.zh-cn.md)

`easy-backup` is a simple and easy-to-use server backup tool for both full and incremental backups, and it supports daily incremental data backup/recovery.

## Trying

```bash
git clone https://github.com/shencangsheng/easy-backup.git
cd easy-backup
chmod +x easy-backup-cli
cp easy-backup-cli /usr/local/bin/
```

## Examples

1. Created `/example/backups/archive.tar.gz` `/example/backups/archive-snapshot`

```bash
easy-backup-cli --snapshot='backup' --action='full' --archive-dir='/example/archive' --output-path='/example/backups'
```

2. Created `/example/backups/archive-inc-yyyy-MM-dd.tar.gz`

```bash
easy-backup-cli --snapshot='backup' --action='inc' --archive-dir='/example/archive' --output-path='/example/backups'
```

3. Restore snapshot `/example/restore/archive` to `/example/restore/archive`

```bash
easy-backup-cli --snapshot='restore' --archive-file='/example/backups/archive.tar.gz' --output-path='/example/restore'
```

4. Restore to the snapshot of 2024-02-01 `/example/restore/archive`

```bash
easy-backup-cli --snapshot='restore' --archive-file='/example/backups/archive.tar.gz' --output-path='/example/restore' --end-date='2024-02-01'
```

### Linux

Run Dependencies

- `/bin/bash`
- `getopts`
- `tar`

use [tar snapshot](https://www.gnu.org/software/tar/manual/html_node/Incremental-Dumps.html) realization

```bash
easy-backup-cli -h
```

## License

A short snippet describing the license (MIT)

MIT © Cangsheng Shen
