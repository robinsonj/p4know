class User < ActiveRecord::Base
  has_and_belongs_to_many :things

  def authenticate(password)
    p4_login(name, password)
  end

  private

  def p4_login(username, password)
    result = `echo #{password} | p4 -p #{P4PORT} -u #{username} login`

    if (/User .* logged in./ =~ result)
      true
    else
      false
    end
  end

end
