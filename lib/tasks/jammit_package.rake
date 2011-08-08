namespace :assets do
  task :rebuild do
    require 'jammit'
    Jammit.package!
  end
end
