#!/bin/bash

#バックアップの保存先の指定
BACKUP_DIR=/backups/mysql-dump

#パスワード設定ファイルから変数を取得
source /var/www/dev.menta.me/backups/.password

#mysqlバックアップ取得
mysqldump -h "$HOST" -u "$USER" -p"$PASSWORD" "$DB_NAME" | gzip  > /var/www/dev.menta.me/backups/mysql-dump/mysql-dump-`date +%Y_%m%d_%H%M%S`.sql.gz

#5日前以降のファイルを削除
OLD_DATE=`date +%Y_%m%d --date "5 days ago"`
OLD_DUMP=${BACKUP_DIR}/mysql-dump-${OLD_DATE}*.sql.gz
rm -f ${OLD_DUMP}
