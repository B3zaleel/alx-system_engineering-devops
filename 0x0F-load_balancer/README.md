# Load Balancer

This project contains tasks for learning about how to work with a load balancer (HAProxy).

## Tasks To Complete

+ [x] 0\. Double the number of webservers<br/>_**[0-custom_http_response_header](0-custom_http_response_header)**_ contains a Bash script that configures a web server.
  + Info:
    + In this first task you need to configure web-02 to be identical to web-01. Fortunately, you built a Bash script during your web server project, and they'll now come in handy to easily configure web-02. Remember, always try to automate your work!
    + Since we're placing our web servers behind a load balancer for this project, we want to add a custom Nginx response header. The goal here is to be able to track which web server is answering our HTTP requests, to understand and track the way a load balancer works. More in the coming tasks.
  + Requirements:
    + Configure Nginx so that its HTTP response contains a custom header (on `web-01` and `web-02`).
      + The name of the custom HTTP header must be `X-Served-By`.
      + The value of the custom HTTP header must be the hostname of the server Nginx is running on.
    + If your server's hostnames are not properly configured (`[STUDENT_ID]-web-01` and `[STUDENT_ID]-web-02`), follow this [tutorial](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-hostname.html).

+ [x] 1\. Install your load balancer<br/>_**[0-install_load_balancer](0-install_load_balancer)**_ contains a Bash script that installs and configures HAproxy on the `lb-01` server.
  + Requirements:
    + Configure HAproxy with a version equal or greater than 1.5 so that it sends traffic to `web-01` and `web-02`.
    + Distribute requests using a roundrobin algorithm.
    + Make sure that HAproxy can be managed via an init script.
    + Make sure that your servers are configured with the right hostnames: `[STUDENT_ID]-web-01` and `[STUDENT_ID]-web-02`. If not, follow this [tutorial](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-hostname.html).

+ [x] 2\. Add a custom HTTP header with Puppet<br/>_**[2-puppet_custom_http_response_header.pp](2-puppet_custom_http_response_header.pp)**_ contains a Puppet manifest that performs the same routines in task 0.
  + Requirements:
    + The name of the custom HTTP header must be `X-Served-By`.
    + The value of the custom HTTP header must be the hostname of the server Nginx is running on.
