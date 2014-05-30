desc 'Prompt for deployment tag'
task :set_deploy_tag do
  default_tag = `git tag`.split("\n").last

  ask :tag, "Tag to deploy (default: #{default_tag}): "
  tag = default_tag if fetch(:tag).empty?

  set :branch, tag.to_s
end

before 'deploy:starting', :set_deploy_tag
