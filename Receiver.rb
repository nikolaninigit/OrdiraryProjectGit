#mora da ide prvo gem install bunny iz konzole

=begin
require "rubygems"
require "bunny" # don't forget to put gem "bunny" in your Gemfile

connection = Bunny.new ENV['CLOUDAMQP_URL']
connection.start # start a communication session with the amqp server

ch=connection.create_channel
q=ch.queue("TestQueue") # declare a queue

begin
  puts " [*] Waiting for messages. To exit press CTRL+C"
  q.subscribe(:block => true) do |delivery_info, properties, body|
    puts " [x] Received #{body}"
  end
rescue Interrupt => _
  connection.stop

  exit(0)
end
=end