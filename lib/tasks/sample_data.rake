namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
  end
end

def make_users
  admin = User.find_by_email("aayush.kothari10@gmail.com")
  admin.toggle!(:admin)
 
end


