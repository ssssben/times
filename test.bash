#!/bin/bash

# ROS 2の環境をセットアップ
source /opt/ros/humble/setup.bash

# ワークスペースをセットアップ
cd ~/ros2_times_ws
source install/setup.bash

# テストを実行
colcon test --packages-select time_publisher
colcon test-result --verbose

