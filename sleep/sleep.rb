$stdout.sync = true

trap('TERM') { puts "SIGTERM received" }
puts "Sleeping forever..."
sleep
