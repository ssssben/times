#!/bin/bash

source /opt/ros/humble/setup.bash
source ~/ros2_times_ws/install/setup.bash

ros2 run time_publisher time_publisher &

sleep 1

ros2 topic echo /current_time --once

if [ $? -eq 0 ]; then
    echo "Test Passed: Time is being published correctly."
else
    echo "Test Failed: No message received from /current_time."
    exit 1
fi

