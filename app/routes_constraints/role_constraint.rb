class RoleConstraint
  attr_reader :roles

  def initialize(*roles)
    @roles = roles.map(&:to_s)
  end

  def matches?(request)
    roles.include? request.env['warden'].user(:user).try(:role)
  end
end
