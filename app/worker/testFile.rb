
=begin
require "active_record"
require "./app/models/user"


puts "Nikola"

ActiveRecord::Base.establish_connection(
    "adapter" => "sqlite3",
    "database"  => "db/development.sqlite3"
  )

require 'config/environment'

nameText="name2"
bioText="promenjenopromenjeno"

User.create(name: nameText, bio: bioText)

if(User.where(name: nameText).count==0)
    User.create(name: nameText, bio: bioText)
else
    instance=User.where(name: nameText).take
    instance.bio="promenjeno promenjeno"
    instance.save
end
=end

puts "Nikola"
