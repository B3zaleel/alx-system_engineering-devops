# What happens when you type https://www.google.com into your browser and hit ENTER?

With over 80% of the search market share, *Google* is by far the world's largest search engine but have you ever wondered what happens when you type `https://www.google.com` into your browser and hit **ENTER**. From a high-level perspective, what happens would look like this:

![Schematic diagram of a client-server interaction](diagram.png)

There seems to be a lot going on there and it's amazing how it takes only a second or two (give or take) for all of that to happen. We need to take a closer look at the diagram above to have a better understanding of what's going on there.

The first thing that happens when you type `https://www.google.com` in the browser and hit ENTER is that the browser checks its DNS (Domain Name System) cache to see if it can find the IP (Internet Protocol) address of the hostname (www.google.com). If the browser's DNS cache doesn't contain the IP address for the hostname, it would have to perform a DNS lookup. This process involves several recursive queries that would lead to the browser receiving the IP address of the server that would handle the request if the DNS lookup was successful.

In order to provide low latency to users, Google has authoritative name servers that would provide the IP address of the closest web service to the user. This is usually based on the user's geolocation and the amount of load at the location of the server. This would mean that DNS-based load balancing occurs before a connection between the user's connection to Google's web search service starts. At the time of writing this article, a DNS query for [www.google.com](www.google.com) provided the IP address 216.58.223.196.

![DNS lookup for www.google.com](dns_lookup.png)

After receiving the IP address, the browser would attempt to establish an SSL (Secure Socket Layer) connection with the server through an SSL handshake not only because the URL uses *https* (Hyper-Text Transmission Protocol Secure), but Google's servers would redirect all http (Hyper-Text Transmission Protocol) requests to https. This is a measure taken by Google to ensure that the communication between its servers and the user is kept secure. Google's servers are also protected by a firewall to monitor incoming and outgoing communications.

![SSL handshake](ssl_handshake.jpg)

Once the connection has been established with the server, the browser would encrypt and send the HTTP request using the HTTP communication rules. The HTTP request would include the request line, several headers, and a body. The request line contains the HTTP method, resource path, and the HTTP version to communicate with. The request line for the HTTP request could look like this:

```http
GET / HTTP/2
```

The headers contain extra information that could help the server identify the client and provide more specific information. Some of the headers that could be sent include the following:

```http
accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
accept-encoding: gzip, deflate, br
accept-language: en-US,en;q=0.9
sec-ch-ua-arch: "x86"
sec-ch-ua-bitness: "64"
sec-ch-ua-platform: "Windows"
sec-ch-ua-platform-version: "14.0.0"
sec-fetch-dest: document
sec-fetch-mode: navigate
sec-fetch-site: same-origin
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62
```

The body of the HTTP request would be empty (as it should be) because nothing is being submitted to the server by the user.

After sending the request, the browser would have to wait for a response from Google's server(s).

Upon receiving the request, Google's data center router would direct the request to an active load balancer that is responsible for handling Google's search service since Google has other services other than search. The load balancer would then decrypt the encrypted HTTP request and forward it to the appropriate Google web server.
The web server (Google Web Server or GWS) is capable of serving static content such as image, video, and audio files. The application server would be responsible for generating the dynamic web page(s) that depend on the user, the user's location, etc. The application server can also fetch data (like the user's profile picture) from Google's database solution and use the result obtained to generate the dynamic web page. Google's load balancer could also .

After the server receives and decrypts the response from Google's server, it would try to display the content received from the server based on the *Content-Type* header in the server's response. If the *Content-Type* was *text/html*, the browser would render a HTML page in the current browser tab and also fetch any declared resource in the HTML page. This would lead to several subsequent requests being made between the browser and the server in order to get all the resources needed to properly render the web page.
