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
  :start_worker_delay => 10,
  :threads => 1,
  :workers => 1,
  :heartbeat=>2
}

Sneakers.configure(opts)


class Processor
  include Sneakers::Worker
  from_queue "TestQueue"
    
  def work(msg)
    parsedMessage = JSON.parse(msg)
    
    instanceCode=parsedMessage["InstanceCode"]
    instanceStatus=parsedMessage["InstanceStatus"]
    
    puts "Instance with id:"+parsedMessage["InstanceCode"] +" is in state: "+parsedMessage["InstanceStatus"]
    
    if RemoteMachine.where(instanceId: instanceCode).count==0
      RemoteMachine.create(instanceId: instanceCode, instanceState: instanceStatus)
    else
      remoteInstance=RemoteMachine.where(instanceId: instanceCode).take
      remoteInstance.instanceState=instanceStatus
      remoteInstance.save
    end
    ack!
  end
  
  
end