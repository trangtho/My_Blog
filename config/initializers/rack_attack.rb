Rack::Attack.throttle('requests by ip', limit: 100, period: 1.minute) do |req|
  req.ip
end
