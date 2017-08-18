Exercises

For each of the following filetypes, indicate whether that filetype is considered server-side or client-side and why.

- Gemfile 
server-side
used by Bundler gem to determine which version of ruby and which gems to bundle with your project (this file is used by Bundler, the Ruby dependency management system, to install libraries needed to run the program)

- Ruby files (`.rb)
server-side
executed by the server, ultimately whatever output it generates is text which is passed to the web server (these files are the core of the Sinatra application. The code within them runs on the server while handling incoming requests.)

- Stylesheets (`.css)
client-side
sent to the client as an http response and executed in the (e.g. browser) (the code within these files is interpreted by the web browser(client) as instructions for how to display a web page)

- JavaScript Files (`.js)
client-side
sent to the client as an http response and executed in the client (e.g. browser) (the code within these files is evaluated by the Javascript interpreter within a web browser (a client) to add behavior to a web page)

- View Templates (`.erb)
server-side
used to generate 100% HTML text that is included as part of an http response. The templates themselves are never sent to the client-side, and are executed server-side. (the ruby code within these files is evaluated on the server to generate a response that will then be sent to the client)