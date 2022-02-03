#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/ubuntu/environment/robot_ws/src/http_node"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/ubuntu/environment/robot_ws/src/http_node/install/http_node/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/ubuntu/environment/robot_ws/src/http_node/install/http_node/lib/python2.7/dist-packages:/home/ubuntu/environment/robot_ws/src/http_node/build/http_node/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/ubuntu/environment/robot_ws/src/http_node/build/http_node" \
    "/usr/bin/python2" \
    "/home/ubuntu/environment/robot_ws/src/http_node/setup.py" \
     \
    build --build-base "/home/ubuntu/environment/robot_ws/src/http_node/build/http_node" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/ubuntu/environment/robot_ws/src/http_node/install/http_node" --install-scripts="/home/ubuntu/environment/robot_ws/src/http_node/install/http_node/bin"
