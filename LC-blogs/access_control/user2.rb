class User
  def name
    "#{first_name} #{last_name}"
  end

  def first_name
    "John"
  end

  def last_name
    "Smith"
  end

  public    :name
  private   :first_name, :last_name
end

class Bot < User
  def operation_name
    "#{name}, Serial: #{serial_number}"
  end

  private

  def serial_number
    rand(10000...99999).to_s
  end

  private :name
end

user = User.new
puts user.name
# user.first_name

bot = Bot.new
puts bot.operation_name
