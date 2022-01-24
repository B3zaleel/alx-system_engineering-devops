# What happens when you type https://www.google.com in your browser and press Enter

This project contains tasks that show if you understand how the internet works from a high-level perspective.

## Tasks To Complete

+ [x] 0. What happens when...<br/>_**[0-blog_post](0-blog_post)**_ contains the URL (preferrably Medium or LinkedIn URL) to a blog post that addresses the following requirements.
  + **INFO**:
    + This question is a classic and still widely used interview question for many types of software engineering position. It is used to assess a candidate's general knowledge of how the web stack works on top of the internet. One important guideline to begin answering this question is that you should ask your interviewer whether they would like you to focus in on one specific area of the workflow. For a front-end position they may want you to talk at length about how the DOM is rendering. For an SRE position they may want you to go into the load balancing mechanism.
    + This question is a good test of whether you understand DNS. Many software engineering candidates struggle with this concept, so if you do well on this question, you are already way ahead of the curve. If you take this project seriously and write an excellent article, it may be something that will grab the attention of future employers.
  + Requirements:
    + Explain what happens when you type [https://www.google.com](https://www.google.com) in your browser and press `Enter`.
    + Your post must cover:
      + DNS request.
      + TCP/IP.
      + Firewall.
      + HTTPS/SSL.
      + Load-balancer.
      + Web server.
      + Application server.
      + Database.

+ [x] 1. Everything's better with a pretty diagram<br/>_**[1-what_happen_when_diagram](1-what_happen_when_diagram)**_ contains the URL of a diagram image that addresses the following requirements.
  + The diagram must be added to your blog post and should illustrate the flow of the request created when you type [https://www.google.com](https://www.google.com) in your browser and press `Enter`.
  + The diagram should show:
    + DNS resolution.
    + That the request hitting server IP on the appropriate port.
    + That the traffic is encrypted.
    + That the traffic goes through a firewall.
    + That the request is distributed via a load balancer.
    + That the web server answers the request by serving a web page.
    + That the application server generates the web page.
    + That the application server request data from the database.

+ [x] 2. Contribute!<br/>_**[0-world_wide_web](0-world_wide_web)**_ contains a URL to a pull request that contributes to the section [here](https://github.com/alex/what-happens-when#the-g-key-is-pressed), which is a question that folks on the internet have been trying to provide a comprehensive answer to.
  + Requirements:
    + The pull request must bring meaningful value (not a typo correction or style improvement).
