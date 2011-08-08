namespace :assets do
  task :rebuild do
    require 'jammit'
    Jammit.package! :base_url => "http://assets.daviferreira.com/"
  end
end
