# 179 Study Notes

## HTTP

- Describe what HTTP is and the role of the request and the response.
  - "A statesless protocol for how clients communicate with servers."
  - HTTP is a protocol
  - It is an agreed way to communicate information between two computers
  - HTTP is also called a 'request-response' protocol
  - Every time the client sends a request to a server, the server will send a response
  - HTTP is a stateless protocol, that means each 'request/response' cycle is unaware of any requests that have come before it
    - this is advantageous because it makes the internet robust and flexible
    - this is a problem in that we often want 'stateful' experiences 
- What are the components of an HTTP request and an HTTP response?
  - An HTTP request has a PATH and a METHOD and optional parameters, headers, and body
  - An HTTP response has a mandatory STATUS and optional headers and body
- Identify the components of a URL. Construct a URL that contains a few params and values.
  - http://www.address.com/?test=value&number=value
  - `http:` is the scheme
  - `www.address.com` is the host, passed to the DNS to resolve the IP address
  - `/` is the path of the request
  - '?hello=yes' is the query string
  - `?` special charater to indicate parameters to follow
  - `&` special chater to indicate multiple parameters
  - `test` and `number` are the parameters
  - `value`s are the values of the parameters
- Explain the difference between GET and POST, and know when to choose each.
  - GET requests should only to retrieve content from a server
    - Think of as 'read-only' operations
  - POST requests involve changing values that are stored on the server
    - Use for submitting data, such as with HTML forms.
    - Can send large information in the request-body than GET can with the limit on query string length
    - Notable exception are search forms which often use GET because they are not changing data on the server
- What is the difference between client-side and server-side code? For each file in a Sinatra project, be able to say which it is.
  - client-side code is executed client-side, i.e. the browser, whereas server-side code is executed on the server
  - In a Sinatra project:
    - *.rb files, *.erb files, Gemfiles, Procfiles, config files, are all executed on the server
    - HTML that is returned as part of the response, CSS files, and Javascript is executed client-side

*Additional notes on HTTP:*

**HTTP is an application protocol**

- It's an agreement or message format of how machines communicate
- It's a 'request response protocol', because it follows the model of the client making a request to a server and waits for a response.
  - Requests and responses are text that follow a specific format
- IP (Internet Protocol) Address is a label that identifies a unique computer
- 192.168.0.1 <- IP address
- 192.168.0.1:3000 <- IP address with port 3000
  - Ports a like an extension for how to communicate
- On the wider internet, each device has a public IP address provided by an ISP

The mapping from URL to IP address is handled by the Domain Naming System (DNS)

- DNS translates www.google.com into its IP address
- DNS is a distributed database, that lives on a world-wide network of DNS servers
- No DNS server has the complete database

Main thing to understand: when your browser issues a request, it's simply sending some text to an IP address

- Client (mostly browsers) issue a request to a server (remote computer)
- Servers are machines capable of handling inbound requests and issuing a response back

Resource is a generic term for things you interact with on the Internet via a URL (files, sites, software, images, videos, etc.)
- Hence URL -> Uniform Resource Locator

HTTP is stateless

- Stateless means that each request/response pair is completely independent of the previous one
- Server does not need to hang on to information between requests, therefore no cleanup
- Makes HTTP resilient and distributed
- Difficult to make stateful applications with
- Difficult to make secure

URL components

- `http:` the scheme - tells web client how to access the resource (as opposed to say ftp)
- `www.example.com` the host - tells the client where the resource is hosted or located (not part of the actual HTTP request the server gets (same for port) - the request is sent to the host)
- `:88` the port or port number - only required if you want a port other than default
  - port `80` is the default port number
  - port `443` is the default port for HTTPS
- `/home/` the path - shows what local resource is being requested (optional)
  - paths can sometimes point at specific files e.g. /home/index.html
- `?item=book` the query string - made up of query parameters (optional)
  - `?` reserved char that marks start of query string
  - `item=book` parameter name/value pair
  - `&` reserved char to add more params to query string
  - how params are used is up to server side application
  - Whenever you type in a URL into browser, you are issuing a HTTP GET request
  - **because query strings are passed in through URL, they are only used in HTTP GET requests**
  - Certain characters must be encoded (such as reserved chars if not using as reserved char e.g. %20 for ' ')

Requests

- HTTP Request Method tells the server what action to perform on a resource
- GET requests are used to retrieve a resource
  - (and they should only retrieve - "read only")
- Response from a GET request can be anything, but if it's HTML, browser will automatically request referenced resources in the file
- POST request is used to submit data
  - (generally via HTML forms)
- POST gets around query string size limitation and can be used to send larger information to the server
- HTTP body can be used to send HTML, images, audio, etc. with POST requests
- HTTP body is like a letter enclosed in an envelope
- Note the difference between request header and response headers
- Most important parts of an HTTP request:
	- HTTP method (GET, POST, etc.) (required)
	- path (required)
	- parameters (optional)
	- headers (optional)
	- message body (for POST requests)

Responses

- HTTP Status Code is a 3-digit number that signifies status of request
  - 200 - OK
  - 302 - Found (usually results in redirect)
    - When your browser see this, it knows the resource has been moved
    - browser automatically follows the new re-routed URL in the `Location` response header
  - 404 - Not found
  - 500 - Internal Server Error
	- Most important parts of HTTP response:
	- HTTP Status code (required)
	- headers (optional)
	- body (optional)

Introducting Statefulness

  - Sessions
    - Session identifier is a unique token that gets passed back and forth between client and server, allowing the server to identify the client
      - Since HTTP is stateless, each request must be inspected to see if it contains a session identifier
      - session has to be validated
      - Server needs to maintain rules on how to store session and recreate application state
    - Session is stored somewhere on the server (persistent storage, database, or something else)
    - Important thing is to know that session id is stored on the client, and used as key to the session data stored server side
      - This is how web applications work around the statelessness of HTTP to create stateful applications
  - Cookies
    - HTTP Cookies are a piece of data that's sent from the server and stored in the client during a request/response cycle
    - Note that session data is store on the server (don't conflate the two)
    - The client side cookie is compared with the server-side session data on each request to identify the current session
    - When a server receives a request with a session id, server will look for the associated data with that id
    - Sidebar: In Sinatra, session data itself is stored in the cookie, but this is not always the case with other web frameworks
  - Asynchronous Javascript and XML (AJAX)
    - allows browsers to issue requests and process responses without a full page refresh
    - AJAX requests are just like normal HTTP requests with the same componenets, and the server handles them like any other request.
      - Only difference is that instead of the browser refresh and processing the response, response is processed by a callback function (usually client-side JavaScript)


  Security
  
- Issue with session id is that if someone else gets a hold of it, they may be able to access a site and be fully logged in, even without having access to the username or password
	- HTTPS addresses this with TLS
	- Also addressed by same-origin policy
	- only permits resources from same originating site or permitted domains via CORS 
	- Guards against session hijacking:
	- Resetting sessions
	- Expiration time on sessions
	- HTTPS to minimize chance attacker can get session id
- Cross-Site Scripting (XSS)
	- type of attack that happens when you allow users to input HTML or JavaScript that ends up being displayed by the site directly
	- If server side code doesn't do any sanitization of input, browser will interpret the HTML and JS and execute it
	- would bypass same origin policy because the code lives on the site
	- Potential solutions
		- Always sanitize user input
		  - disable HTML / javascript input in favor of markdown
		  - escape all user input data when displaying it
		    - browser won't view it as code

### More Background
  - Notion of “Server”
    - Simplified but slightly disambiguated:
      - Web Server (Webrick or Puma, or the one we made ourselves in manually handling HTTP requests)
        - Server that responds to static assets: files, images, css, javascript
        - These requests don't require any data processing and are handled by a simple web server
        - Sidebar: Rack / Sinatra
	        - Rack helps applications code connect to web servers (but is not a web server itself) by providing a fluid API for interfacing with web servers
	        - Abstracts away the mundane work of connecting and communicating with the web serving and content generating tiers of Ruby web applications
	        - Sinatra is “Rack”-based meaning it lives on top of Rack
		        - At its core, Sinatra is nothing more than some Ruby code connecting to a TCP server, handling requests and sending back response all in a HTTP-compliant string format
      - Application Server
        - Where application and business logic resides
        - Where server side code lives when deployed
        - Wraps the web server and application code
      - Data Store
        - Application servers will consult persistent data stores
        - Can be relational databases or as simple as files, key/value stores, and many other variations, as long as it can save data in some format for later retrieval and processing
  - HTTP and TCP/IP
    - There are many layers between a request from a laptop to a server
      - The protocols that make up these layers are known as the Open Systems Interconnection model (OSI)
      - HTTP is an application layer protocol
      - TCP/IP represent lower layers in the communication stack
      - HTTP is along the lines of a convention and only operates at the application layer
      - OSI model specifies communication rules among systems on the internet across all layers
      - HTTP uses TCP/IP under the hood as transport and network layers -- TCP/IP does all the heavy lifting ensuring request/response cycles get completed

## Web

- How does an HTML form element interact with the server-side code that processes it.
  - When an HTML form is submitted with a POST method, it issues a POST request to the server, with the inputs as the parameters
  - The server side code can take that post request and the associated parameters and process them
- Why is user-entered content a security risk? Be aware of how to mitigate this risk.
  - vulnerable to cross-site scripting (XSS)
  - allows malicious code to be injected into a page, and the browser will execute the HTML and JS injected into it
    - can bypass same-origin policy since the code lives on the site
  - Mitigated by:
    - input sanitization - disallowing HTML or JS in favor of markdown
    - input sanitization - escape all user input data when displaying it so that browser doesn't view it as code





## Sinatra

- Start a new Sinatra project and write simple routes to handle requests.
	- Gemfile with gems for sinatra and eribus
	- setup views and data folders as appropriate
	- create main project rb file
	- set up routes and views
- What are the benefits of using view templates? Be able to use an ERB template in a Sinatra route.
	- can be written in many templating languages such as ERB
	- Provide a place to define the HTML display outside of the route handling it — better suited to describing HTML than plain Ruby
	- view templates are files that contain text that is converted into HTML before being sent to the client in a response
	- view templates keep what is displayed in the browser separate from the application logic
	- makes the application more dynamic, by keeping presentation consistent and less repetitive across pages with layouts, and giving you the flexibility of displaying dynamic values from your application code
	- Allow us to do pre-processing on the server side in a programming language and then translate the programming code into a string to return to the client
- What is the session? Where it is stored? How it is used?
	- the session is data that can help create a sense of statefulness for a website
	- they require a session store, and are stored on the server somewhere
	- a session id is used to figure out what information pertains to what user, and a session id is stored in the browser cookie
	- However, as far as Sinatra goes, Sinatra (actually, rack) stores session data in a client-side cookie by default. That means the book is correct, the entire session data is transferred on each request
	- it's possible to have a session store that's not using the cookie (or only using the cookie to store the session id)
- Write a view helper and use it within a view template.
	- Use to minimize the amount of ruby code included in a view template
	- helpful use case: change class of an object based on certain condtions which can change how CSS styles it
		- Maybe can expand my contact manager to style contact names based on what group they are in (friends, family, work, etc.)
			- helper can parse a class for the header or something like that
- Explain how redirection works and why it would be needed in a web application.
	- `redirect` uses `halt` and issues a new response to the specified route
	- `redirect` aborts handling of the current request
	- redirect call terminates the request handling early
	- This is useful when you want to restrict certain actions in the application, and redirect can be used to abort handling of the request, and issue a response to another page (such as a sign in page)