# JSON Parsing example
require "rubygems"
require "json"

s= '{"InstanceCode":"i-012345shju","InstanceStatus":"Running"}'

puts s
parsed = JSON.parse(s) # returns a hash


puts parsed["InstanceCode"]
puts parsed["InstanceStatus"]




