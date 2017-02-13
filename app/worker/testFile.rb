=begin
require "./config/environment"
require "active_record"
require "./app/models/user"


puts "Nikola"
puts  Rails.env=="development"
=end

=begin
ActiveRecord::Base.establish_connection(
    "adapter" => "sqlite3",
    "database"  => "db/development.sqlite3"
  )

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

