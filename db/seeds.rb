# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Creates a record for allowing comment in Settings
Setting.create({
  :name => "comment_allowed",
  :value => '1',
  :destroyable => '1',
  :created_at => Time.now,
  :updated_at => Time.now
})

#Creates a record for moderating comment in Settings
Setting.create({
    :name => "comment_moderation",
    :value => '1',
    :destroyable => '1',
    :created_at => Time.now,
    :updated_at => Time.now
})

#Creates a record for notification recipients in Settings
Setting.create({

    :name => "notification_recipient",
    :value => 'admin@mcms.com',
    :destroyable => '1'

})

#Checking for the mcms_pages gem in application
#then creates a record for pages table that blog should be shown in menu.
if Gem.available?('mcms_pages')
  page = ::Page.create(
    :title => "Blog",
    :link_url => "/blog/posts",
    :show_in_menu => "1",
    :published => "1"
  )

end
