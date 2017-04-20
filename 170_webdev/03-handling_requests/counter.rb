require 'socket'

def parse_request(request)
  http_method, path_params, http = request.split(/\s/)
  path, params = path_params.split('?')

  params = (params || '').split('&').map { |pair| pair.split("=") }.to_h
  [http_method, path, params]
end

server = TCPServer.new('localhost', 3005)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)

  client.puts 'HTTP/1.0 200 OK'
  client.puts 'Content-Type: text/html'
  client.puts
  client.puts '<html>'
  client.puts '<body>'
  client.puts '<pre>'
  client.puts http_method
  client.puts path
  client.puts params
  client.puts '</pre>'

  client.puts '<h1>Counter</h1>'
 
  number = params['number'].to_i
  client.puts "<p>The current number is #{number}.</p>"
  client.puts "<a href='?number=#{number + 1}'>Add one</a>"
  client.puts "<a href='?number=#{number - 1}'>Subtract one</a>"
  client.puts '</body>'
  client.puts '</html>'

  client.close
end