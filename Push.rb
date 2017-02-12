#mora da ide prvo gem install bunny iz konzole
# skripta za slanje i citanje iz queue-a

=begin
require "bunny" # don't forget to put gem "bunny" in your Gemfile

connection = Bunny.new ENV['CLOUDAMQP_URL']
connection.start # start a communication session with the amqp server

ch=connection.create_channel
q=ch.queue("TestQueue") # declare a queue

messageToSend="Hello world!"

#NACIN 2 - DRUGI NACIN PUBLISHOVANJA
ch.default_exchange.publish(messageToSend, :routing_key => q.name)


connection.stop # close the connection
=end