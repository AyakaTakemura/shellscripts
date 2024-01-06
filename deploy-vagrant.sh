#!/bin/bash

#Vagrantfileが置いてあるディレクトリへ移動
cd /Users/apple/vagrant/dev

#ヘルプ関数定義
function help () {
echo "下記のようにstatusを指定して実行してください。
(例) ./deploy-vagrant.sh  status,up,suspend"
}

#引数を変数に代入
vagrant_options=$1

#引数が空の場合、help関数を実行。それ以外であれば引数をvagrantコマンドのオプションとして実行。
if [ -z ${1} ]; then
help

else vagrant $vagrant_options

fi
