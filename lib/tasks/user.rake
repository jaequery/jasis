namespace :user do
  desc "get first user"
  task :first do |t, args|
    user = User.first
    puts "first user is: #{user.first_name}"
  end
end