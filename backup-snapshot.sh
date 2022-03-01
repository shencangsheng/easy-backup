#!/bin/bash
# creator by shencangsheng
set -e

backup_path=
backup_file_name=
backup_exec_path=
backup_target_file=
backup_excludes=()
backup_operation=
while getopts "p:n:e:t:i:o:h" opt; do
    case $opt in
    p)
        backup_path=$OPTARG
        ;;
    n)
        backup_file_name=$OPTARG
        ;;
    e)
        backup_exec_path=$OPTARG
        ;;
    t)
        backup_target_file=$OPTARG
        ;;
    i)
        backup_excludes=(${OPTARG//,/ })
        ;;
    o)
        backup_operation=$OPTARG
        ;;
    h)
        echo "This is a script to generate a full/incremental backup"
        echo "Usage: bash backup-snapshot.sh [OPTION...]"
        echo ""
        echo "Examples:"
        echo "bash backup-snapshot.sh -o full -p /data -n example -e /backup -t example  # Full backup of [/data/example] to [/backup/example_full.tar.gz]"
        echo "bash backup-snapshot.sh -o full -p /data -n example -e /backup -t example -i file/pdf,file/word  # Back up the full amount of [/data/example] to [/backup/example_full.tar.gz], excluding the file [/data/example/file/example]"
        echo "bash backup-snapshot.sh -o incremental -p /data -n example -e /backup -t example  # Incremental backup of [/data/example] to [/backup/example_incremental_\${current_date}.tar.gz]"
        echo ""
        echo "Main operation mode:"
        echo ""
        echo "-o, full/incremental # Select full/incremental backup [Required]"
        echo "-p, # The parent directory of the target backup file [Required]"
        echo "-n, # Target backup file name [Required]"
        echo "-e, # Backup directory [Required]"
        echo "-t, # Backup file name [Required]"
        echo "-i, # Ignore the backup files, Use commas to separate [Optional]"
        echo ""
        exit 0
        ;;
    *)
        echo "there is unrecognized parameter."
        ;;
    esac
done

set -u

TAR="tar --listed-incremental=${backup_exec_path}/${backup_file_name}-snapshot -zcf"

backup_exclude_files=""

if [[ ${#backup_excludes[@]} > =0 ]]; then
    for backup_exclude in ${backup_excludes[@]}; do
        backup_exclude_files=${backup_exclude_files}"--exclude ${backup_target_file}/${backup_exclude} "
    done
fi

backup_start_time=$(date +'%Y-%m-%d %H:%M:%S')
backup_start_seconds=$(date --date="$backup_start_time" +%s)
case $backup_operation in
full)
    echo "start full backup..."
    ${TAR} ${backup_exec_path}/${backup_target_file}_full.tar.gz -C ${backup_path} ${backup_file_name} ${backup_exclude_files}
    ;;
incremental)
    echo "start incremental backup..."
    current_date=$(date "+%Y-%m-%d")
    ${TAR} ${backup_exec_path}/${backup_target_file}_incremental_${current_date}.tar.gz -C ${backup_path} ${backup_file_name} ${backup_exclude_files}
    ;;
*)
    echo 'Must choose backup action, full/incremental'
    exit 1
    ;;
esac

backup_end_time=$(date +'%Y-%m-%d %H:%M:%S')
backup_end_seconds=$(date --date="$backup_end_time" +%s)
echo "backup successful, use time "$((backup_end_seconds - backup_start_seconds))" seconds."
