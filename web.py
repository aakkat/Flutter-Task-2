#!/usr/bin/python3

import cgi
import subprocess

print("content-type: text/html")
print()

mydata = cgi.FieldStorage()
myx = mydata.getvalue("x")
myy = mydata.getvalue("y")

cmd = "sudo docker run -dit --name {} {}".format(myx,myy)

output = subprocess.getoutput(cmd)
print(output)
