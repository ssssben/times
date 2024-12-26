cmake_minimum_required(VERSION 3.5)

project(time_publisher)

find_package(ament_cmake REQUIRED)
find_package(rclpy REQUIRED)
find_package(std_msgs REQUIRED)


install(
  DIRECTORY launch
  DESTINATION share/${PROJECT_NAME}/
)

install(PROGRAMS
  time_publisher/time.py
  DESTINATION lib/${PROJECT_NAME}
)

ament_package()

