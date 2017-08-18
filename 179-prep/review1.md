## HTTP

- Describe what HTTP is and the role of the request and the response.
	- HTTP is a protocol for communicating between machines
	- It is a request response protocol: the client makes a request to a server and waits for a response from the server.
	- HTTP is a stateless protocol which means that each request/response cycle is completely independent of the previous one
		- This is good because it makes HTTP robust and flexible
		- This downside is that it makes it difficult to create stateful applications and can make security challenging
	- what is the ROLE of the request?
		- The role of the request is to tell the server what action to perform on a resource, depending on the HTTP request method
		- It is used to request content from a server (like a GET request), or submit data to the server to change values stored on the server (such as a POST request).
	- what is the ROLE of the response?
		- The role of the response is to complete the request/response cycle
		- It is used to return status information and content (response headers / body) depending on the request
	
- What are the components of an HTTP request and an HTTP response?
	- The components of an HTTP request are:
		- Method (required) - (e.g. GET or POST)
		- Path (required) - the local resource requested
		- Parameters (optional) - A query string with parameters
		- Header (optional)
		- Body (optional)
	- The components of an HTTP response are:
		- Status Code (required) - such as 200 (OK), or 302 (Found)
		- Header (optional)
		- Body (optional)
- Identify the components of a URL. Construct a URL that contains a few params and values.
	- http://www.example.com:3000/?size=large&color=blue
	- `http:` the scheme
	- `www.example.com` the host
	- `:3000` the port
	- `/` the path (the forward slash after `:3000`)
	- `?size=large&color=blue` query string
	- `?` reserved char for parameter key/value pairs to follow
	- `size=large` + `color=blue` parameter key/value pairs
	- `&` reserved char for multiple key/value pairs
- Explain the difference between GET and POST, and know when to choose each.
	- GET requests are for retrieving content from the server
		- Generally does not change values of data stored on the server
	- POST requests are for changing values stored on the server
		- HTML forms submitting data to the server
- What is the difference between client-side and server-side code? For each file in a Sinatra project, be able to say which it is.
	- Client-side code is executed on the client
	- Server-side code is executed on the server
	- In a Sinatra project the following are examples of client-side code that are run in the browser (client):
		- HTML, CSS, JavaScript
	- The following are examples of server-side code:
		- Gemfile, Ruby files, ERB templates (although they ultimately return HTML code that is client-side code, the template itself is first executed on the server to generate the HTML), yaml files

## Web

- How does an HTML form element interact with the server-side code that processes it.
	- When an HTML is form is submitted with a POST method in it’s `method` attribute, it issues a POST request to the server, with the form inputs made available to the server as parameters.
	- An HTML form element can be used to submit data via a POST request to the server. Assuming the data submitted is valid per the application code on the server, this will generally be used by the server to change some values that are stored by the server.
	- This mechanism is accomplished by setting the `name=` attribute in an `<input>` tag, and accessing it via the `params` hash
- Why is user-entered content a security risk? Be aware of how to mitigate this risk.
	- User entered content is a security risk due to the possibility of cross-site scripting.
	- Cross-site scripting is the injection of code, such as HTML or Javascript, via user-entered content which is then executed by the page.
	- This is especially troublesome as it also avoids safeguards such as the single-origin policy, since the code resides on the same source? domain?
	- This could be used to steal sessions or implement other malicious behavior
	- This can be mitigated primarily via input validation
		- Examples of such validation would be to disallow HTML or JavaScript input in favor of markdown
		- Escaping HTML, so that all user input is escaped and therefore not executed as code

## Sinatra

- Start a new Sinatra project and write simple routes to handle requests.
- What are the benefits of using view templates? Be able to use an ERB template in a Sinatra route.
	- View templates have several benefits:
		- Separation of concerns between application logic and presentation - view templates are better at defining HTML display of information than Ruby
		- Allows for flexibility while maintaining consistency - allows for the display of dynamic values from the application, while maintaining a consistent appearance across an application (e.g. by using a layout template)
		- The previous point also has the benefit of minimizing the amount of code required to have multiple views
- What is the session? Where it is stored? How it is used?
	- The session is data that is used to create a stateful experience, even though HTTP is a stateless protocol. 
	- It is generally stored somewhere in the server (persistant storage, database, etc.), although Rack’s default configuration stores the session data in the client cookie. 
	- The server uses the session to keep track of distinct client sessions with a session identifier. 
	- Session identifier is a unique token that gets passed back and forth between client and server, allowing the server to identify the client. It acts as the key to the session data stored on the server.
- Write a view helper and use it within a view template.
	- Purpose of a view helper is to keep as much application logic out of the view templates as possible.
- Explain how redirection works and why it would be needed in a web application.
	- Redirection aborts the handling of the current request and issues a new response to a specified route
	- Redirection works by aborting the current request handling and issuing a new request specified by the application code
	- This is useful when you want to be able restrict certain actions in the application.
	- A common use case is requiring an active user session in order to view a certain resource. If a client attempts to access such a resource without a valid session, using redirect as a guard clause (e.g. `redirect ‘/signin’ unless session[:user]` or a method that would accomplish something similar) would prevent the rest of the code at that route from executing, and redirect that user to `/signin`.