#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_times_ws || { echo "Directory $dir/ros2_times_ws not found."; exit 1; }

colcon build || { echo "Build failed."; exit 1; }

source $dir/ros2_times_ws/install/setup.bash

timeout 10 ros2 run time_publisher time_publisher > /tmp/time_publisher.log 2>&1

if grep -q 'Publishing: "Current time:' /tmp/time_publisher.log; then
    echo "Test Passed: Node is publishing the time."
    exit 0
else
    echo "Test Failed: Node is not publishing the expected messages."
    cat /tmp/time_publisher.log  # デバッグ用にログを表示
    exit 1
fi

