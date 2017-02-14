require "active_record"
require "./app/models/remote_machine"
require "rubygems"
require "json"
require 'sneakers' 
require 'sneakers/runner'
require "./config/environment"

opts = {
  :amqp => 'amqp://nvmlsxgx:YNkBAzaOuZotz3Zve0TL9w-oiEqrw0bZ@hyena.rmq.cloudamqp.com/nvmlsxgx',
  :exchange_type => 'direct',
  :durable=>false,
  :exchange => 'sneakers',
  :start_worker_delay => 10
}

Sneakers.configure(opts)

if Rails.env=="development"
  ActiveRecord::Base.establish_connection(
      "adapter" => "sqlite3",
      "database"  => "db/development.sqlite3"
    )
end

#RemoteMachine.create(instanceId: "idCustomNew", instanceState: "statusCustomNew")

class Processor
  include Sneakers::Worker
  from_queue "TestQueue"
    
  
  def work(msg)
    parsedMessage = JSON.parse(msg)
    
    instanceCode=parsedMessage["InstanceCode"]
    instanceStatus=parsedMessage["InstanceStatus"]
    
    puts "Instance with id:"+parsedMessage["InstanceCode"] +" is in state: "+parsedMessage["InstanceStatus"]
    
    if(RemoteMachine.where(instanceId: instanceCode).count==0)
      RemoteMachine.create(instanceId: instanceCode, instanceState: instanceStatus)
    else
      remoteInstance=RemoteMachine.where(instanceId: instanceCode).take
      remoteInstance.instanceState=instanceStatus
      remoteInstance.save
    end
    
    ack!
  end
  
end

#if Rails.env=="development"
#  r = Sneakers::Runner.new([Processor])
#  r.run 
#end