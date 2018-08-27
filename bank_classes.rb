class Customer

  attr_accessor :name, :location

  def initialize(name, location)
    @name = name
    @location = location
  end
end


class Accounts

  attr_reader :acct_number, :balance
  attr_accessor :customer, :acct_type
  def initialize(customer, balance, acct_number, acct_type)
    @customer = customer
    @balance = balance
    @acct_type = acct_type
    @acct_number = acct_number
  end

  def deposit
    puts "How much would you like to deposit? "
    print "$"
    amount = gets.chomp.to_f
    @balance += amount
    puts "Your new balance is $ #{'%0.2f'%(@balance)}"
  end

  def withdrawal
    puts "How much would you like to widthdrawl? "
    print "$"
    amount = gets.chop.to_f
    if @balance < amount
      @balance -= (amount +25)
    else
      @balance
  end
  puts "Your new balance is $ #{'%0.2f'%(@balance)}"
  end
end
