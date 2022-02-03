cmake_minimum_required(VERSION 3.0.2)
project(http_node)


################################################################################
# Find catkin packages and libraries for catkin and system dependencies
################################################################################
find_package(catkin REQUIRED COMPONENTS
  
  std_msgs
)

################################################################################
# Setup for python modules and scripts
################################################################################
catkin_python_setup()

################################################################################
# Declare ROS messages, services and actions
################################################################################

################################################################################
# Declare ROS dynamic reconfigure parameters
################################################################################

################################################################################
# Declare catkin specific configuration to be passed to dependent projects
################################################################################
catkin_package(
  CATKIN_DEPENDS
    rospy
    std_msgs
)

################################################################################
# Build
################################################################################
include_directories(
  include scripts launch
  ${catkin_INCLUDE_DIRS}
)

################################################################################
# Install
################################################################################
# Add your custom nodes here. 
catkin_install_python(PROGRAMS 
  scripts/webserver.py scripts/run_webserver.sh
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY launch scripts
    DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)