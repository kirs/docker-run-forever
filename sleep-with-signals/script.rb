require 'net/http'

class Runner
  def initialize
    @count = 0
  end

  EXIT_AFTER = 5
  def perform
    loop do
      res = Net::HTTP.get_response('google.com', '/index.html')
      puts "Running #{@count}, #{res.inspect}"
      @count += 1
      sleep 1
    end
  end

  def register_signal_handlers
    trap('TERM') { debug("TERM") }
    trap('PIPE') { debug("PIPE") }
  end

  def debug(signal)
    puts "Received #{signal}"
  end
end

$stdout.sync = true

runner = Runner.new
runner.register_signal_handlers
runner.perform
