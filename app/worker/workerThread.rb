require "rubygems"
require "json"
require 'sneakers' # put gem "sneakers" in your Gemfile
require 'sneakers/runner'

opts = {
  :amqp => 'amqp://nvmlsxgx:YNkBAzaOuZotz3Zve0TL9w-oiEqrw0bZ@hyena.rmq.cloudamqp.com/nvmlsxgx',
  :exchange_type => 'direct',
  :durable=>false,
  :exchange => 'sneakers',
  :start_worker_delay => 10
}

Sneakers.configure(opts)


class Processor
  include Sneakers::Worker
  from_queue "TestQueue"
    
  
  def work(msg)
    parsedMessage = JSON.parse(msg) 
    puts "Instance with id:"+parsedMessage["InstanceCode"] +" is in state: "+parsedMessage["InstanceStatus"]
    ack!
  end
  
end

#r = Sneakers::Runner.new([Processor])
#r.run 