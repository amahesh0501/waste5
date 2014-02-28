# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

videos = ["RRPcYcaggNE", "yUYrpC4KFMs", "6OfQi6zIlzE", "7pYOZduNhtY", "VIMQV_vnkNc", "txEUyOKrCxM"]

videos.each do |video_id|
  Post.create(youtube_id: video_id)
end