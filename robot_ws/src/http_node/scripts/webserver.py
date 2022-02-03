#!/usr/bin/env python
            
import rospy
import http.server
import socketserver
import sys

def start_server(port):
    # Start a webserver
    httpd = socketserver.TCPServer(("", int(port)), http.server.SimpleHTTPRequestHandler)
    rospy.loginfo('Webserver at port {}'.format(port))
    httpd.serve_forever()

def main():

    rospy.init_node("webserver")
    if len(sys.argv) > 1:
        server_port = sys.argv[1]

    start_server(server_port)
    rospy.spin()

if __name__ == '__main__':
    main()