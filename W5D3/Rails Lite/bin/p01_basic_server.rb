require 'rack'

Rack::Server.start(
  app: Proc.new do |env|
    ['200', {'Content-Type' => 'text/html'}, ['hello world']]
  end,
  Port: 3000
)

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res.write("Hello world!")
  res.finish
end