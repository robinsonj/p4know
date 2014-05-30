desc 'Prompt for deployment tag'
task :set_deploy_tag do
  default_tag = `git tag`.split("\n").last

  ask :tag, default_tag

  tag = fetch(:tag)

  tag = default_tag if tag.empty?

  set :branch, tag

  if fetch(:branch)
    puts "Creating archive from tag #{fetch(:branch)}."
  else
    puts "Can not create archive from tag #{fetch(:branch)}."
  end
end

before 'deploy:starting', :set_deploy_tag
