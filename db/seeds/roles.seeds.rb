roles = %w(person admin)

roles.each do |role|
  Role.find_or_create_by(name: role)
end
