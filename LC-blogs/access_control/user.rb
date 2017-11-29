class User
  def name
    puts "Sam"
  end

  private :name
end

user = User.new
user.send(:name)
user.public_send(:name)
