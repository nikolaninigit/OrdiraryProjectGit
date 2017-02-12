#mora da ide prvo gem install bunny iz konzole

=begin
require "bunny" # don't forget to put gem "bunny" in your Gemfile

connection = Bunny.new ENV['CLOUDAMQP_URL']
connection.start # start a communication session with the amqp server

ch=connection.create_channel
q=ch.queue("TestQueue") # declare a queue



delivery,headers,msg = q.pop # get message from the queue

if(msg==nil)
    puts "msg je nil i u queue nema nista"
else
    puts "This is the message: " + msg + "\n\n"
end

connection.stop # close the connection
=end