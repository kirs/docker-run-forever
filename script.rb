class Runner
  def initialize
    @count = 0
    @shutdown_on = nil
  end

  EXIT_AFTER = 5
  def perform
    loop do
      puts "Running #{@count}, shutdown: #{@shutdown.inspect}"
      @count += 1
      sleep 1
    end
  end

  def register_signal_handlers
    trap('TERM') { shutdown }
  end

  def shutdown
    puts "Exiting with TERM in #{EXIT_AFTER} seconds..."
    @shutdown = true
    Thread.new do
      sleep EXIT_AFTER
      puts "Time to shutdown"
      exit 1
    end
  end
end

$stdout.sync = true

runner = Runner.new
runner.register_signal_handlers
runner.perform
