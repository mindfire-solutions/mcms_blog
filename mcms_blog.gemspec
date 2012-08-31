$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mcms_blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mcms_blog"
  s.version     = "0.0.3"
  s.authors     = ["Debadatta Pradhan"]
  s.email       = ["debadattap@mindfiresolutions.com"]
  s.homepage    = "https://192.168.10.251/svn/SVNHOME/mcms/trunk/mcms_gems/mcms_blog"
  s.summary     = "Summary of McmsBlog."
  s.description = "Description of McmsBlog."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "ckeditor", "3.7.1"
  s.add_dependency "crudify"
  s.add_dependency "acts-as-taggable-on"
  s.add_dependency "friendly_id"
  s.add_dependency "paperclip"
  s.add_dependency "will_paginate"

end

