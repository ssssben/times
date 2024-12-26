#!/bin/bash

# 引数が指定されている場合、指定されたディレクトリを使用
dir=~
[ "$1" != "" ] && dir="$1"

# ROS 2 ワークスペースディレクトリに移動
cd $dir/ros2_times_ws

# ビルド
colcon build

# ROS 2 環境を設定
source install/setup.bash

# ノードを起動し、出力をログに保存
timeout 10 ros2 run time_publisher time_publisher > /tmp/time_publisher.log

# ログ内容を確認
cat /tmp/time_publisher.log | grep 'Publishing:'

