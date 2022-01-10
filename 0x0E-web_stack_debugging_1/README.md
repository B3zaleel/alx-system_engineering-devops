# Web Stack Debugging

This project contains tasks for learning about how to debug web stacks.

## Tasks To Complete

+ [x] 0. Nginx likes port 80<br/>_**[0-nginx_likes_port_80](0-nginx_likes_port_80)**_ contains a Bash script that fixes a failing server with the minimum number of commands.
  + Info:
    + Using your debugging skills, find out what’s keeping your Ubuntu container’s Nginx installation from listening on port 80. Feel free to install whatever tool you need, start and destroy as many containers as you need to debug the issue.
    + Example:
    ```powershell
    root@966c5664b21f:/# curl 0:80
    curl: (7) Failed to connect to 0 port 80: Connection refused
    root@966c5664b21f:/#
    root@966c5664b21f:/# ./0-nginx_likes_port_80 > /dev/null 2&>1
    root@966c5664b21f:/#
    root@966c5664b21f:/# curl 0:80
    <!DOCTYPE html>
    <html>
    <head>
    <title>Welcome to nginx!</title>
    <style>
        body {
            width: 35em;
            margin: 0 auto;
            font-family: Tahoma, Verdana, Arial, sans-serif;
        }
    </style>
    </head>
    <body>
    <h1>Welcome to nginx!</h1>
    <p>If you see this page, the nginx web server is successfully installed and
    working. Further configuration is required.</p>

    <p>For online documentation and support please refer to
    <a href="http://nginx.org/">nginx.org</a>.<br/>
    Commercial support is available at
    <a href="http://nginx.com/">nginx.com</a>.</p>

    <p><em>Thank you for using nginx.</em></p>
    </body>
    </html>
    root@966c5664b21f:/#
    ```
  + Requirements:
    + Nginx must be running, and listening on port `80` of all the server’s active IPv4 IPs.
    + Write a Bash script that configures a server to the above requirements.

+ [x] 1. Make it sweet and short<br/>_**[1-debugging_made_short](1-debugging_made_short)**_ contains a Bash script that uses what was done for task #0, but short and sweet.
  + Requirements:
    + Your Bash script must be 5 lines long or less.
    + There must be a new line at the end of the file.
    + You must respect usual Bash script requirements.
    + You cannot use `;`, `&&`, and `wget`.
    + You cannot execute your previous answer file (Do not include the name of the previous script in this one).
    + `service` (init) must say that `nginx is not running` ← for real.
    + Example:
    ```powershell
    root@966c5664b21f:/# curl 0:80
    curl: (7) Failed to connect to 0 port 80: Connection refused
    root@966c5664b21f:/#
    root@966c5664b21f:/# cat -e 1-debugging_made_short | wc -l
    5
    root@966c5664b21f:/# ./1-debugging_made_short
    root@966c5664b21f:/# curl 0:80
    <!DOCTYPE html>
    <html>
    <head>
    <title>Welcome to nginx!</title>
    <style>
        body {
            width: 35em;
            margin: 0 auto;
            font-family: Tahoma, Verdana, Arial, sans-serif;
        }
    </style>
    </head>
    <body>
    <h1>Welcome to nginx!</h1>
    <p>If you see this page, the nginx web server is successfully installed and
    working. Further configuration is required.</p>

    <p>For online documentation and support please refer to
    <a href="http://nginx.org/">nginx.org</a>.<br/>
    Commercial support is available at
    <a href="http://nginx.com/">nginx.com</a>.</p>

    <p><em>Thank you for using nginx.</em></p>
    </body>
    </html>
    root@966c5664b21f:/#
    root@966c5664b21f:/# service nginx status
     * nginx is not running
    root@966c5664b21f:/#
    ```
