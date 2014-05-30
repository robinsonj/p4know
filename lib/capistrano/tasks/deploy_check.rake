desc 'Check deployment user write permissions'
task :check_write_permissions do
  on roles(:all) do |host|
    if test("[ -w #{fetch(:deploy_to)} ]")
      info "#{fetch(:deploy_to)} is writable on #{host}"
    else
      error "#{fetch(:deploy_to)} is not writable on #{host}"
    end
    if test("[ -w #{fetch(:deploy_to)}/releases ]")
      info "#{fetch(:deploy_to)}/releases is writable on #{host}"
    else
      error "#{fetch(:deploy_to)}/releases is not writable on #{host}"
    end
    if test("[ -w #{fetch(:deploy_to)}/shared ]")
      info "#{fetch(:deploy_to)}/shared is writable on #{host}"
    else
      error "#{fetch(:deploy_to)}/shared is not writable on #{host}"
    end
    if test("[ -w #{fetch(:deploy_to)}/repo ]")
      info "#{fetch(:deploy_to)}/repo is writable on #{host}"
    else
      error "#{fetch(:deploy_to)}/repo is not writable on #{host}"
    end
  end
end

before 'deploy:starting', :check_write_permissions
