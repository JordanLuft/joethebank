require_relative 'bank_classes'

@customers = []
@accounts = []

#1.Welcome screen. The first thing the user sees
def welcome_screen
  @current_customer = ""
  puts "Welcome to Joes bank"
  puts "Please chose from the following"
  puts "- - - - - - - - - - - - - - - - - -"
  puts "1. Customer sign-in"
  puts "2. New Customer"
  choice = gets.chomp.to_i
  case choice
  when 1 then sign_in
  when 2 then sign_up("","")
  end
end

#2.sign in===================
def sign_in
  print "What's your name? "
  name = gets.chomp
  print "What's your location? "
  location = gets.chomp

  if @customers.empty?
    puts "NO customer found with that information."
    sign_up(name, location) #We wrote this before we built it
end
customer_exist = false
@customers.each do |customer| #for each
  if name == customer.name && location == customer.location
    @current_customer = customer
    customer_exist = true
  end
end
  if customer_exists
  account_menu
  else
    puts "NO customer found with that information."
    puts "1. try again?"
    puts "2. Sign Up"
    choice = gets.chomp.to_i
    case choice
    when 1 then sign_in
    when 2 then sign_up
    end
  end
end
#end of 2==========================
# 3 sign up =======================
def sign_up(name, location)
  if name == "" && location == ""
    print "What's your name? "
    name = gets.chomp
    print "What's your location? "
    location = gets.chomp
  end
  @current_customer = Customer.new(name, location)
  @customers.push(@current_customer)
  puts "Registration successfull!"
  account_menu
end
#2 end of sign up
#4
def account_menu
  puts "Account menu"
  puts "- - - - - -"
  puts "1. Create an account"
  puts "2. Review an account"
  puts "3. Sign Out"
  choice = gets.chomp.to_i
  case choice
  when 1 then create_account
  when 2 then review_account
  when 3 then
    puts "thanks for banking with us!!!"
    welcome_screen
  else
    puts "Invalad selection"
    account_menu
  end
end

def create_account
  print "how much should your intiial deposit be? $"
  amount = gets.chomp.to_f
  print "What type of account will you be opening "
  acct_type = gets.chomp
  new_acct = Account.new(@current_customer, amount, (@account.length+1),acct_type)
  @accounts.push(new_acct)
  puts "Account successfully created!"
  account_menu
end

def review_account
  @current_account = ""
  print "Which account (type) do you want to review? "
  type = gets.chomp.downcase
  account_exists = false
  @account.each do |account|
    if @current_customer == account.customer && type == account.acct_type.downcase
      @current_account = account
      account_exists = true
    end
  end
  if account_exists
    current_account_actions
  else
    puts "Try again."
    review_account
  end
end

def current_account_actions
  puts "Choose From the Following:"
  puts " - - - - - - - - - -  - -- - - - - -  -- "
  puts "1. Balance check"
  puts "2. Make a deposit"
  puts "3. Make a withdrawal"
  puts "4. Return to account menue"
  puts "5. Sign out"
  choice = get.chomp.to_i
  case choice
  when 1
    puts "Current balcance is $#{'%0.2f'%(@current_account.balance)}"
    current_account_actions
  when 2
    @current_account.deposit
    current_account_actions
  when 3
    @current_account.withdrawal
    current_account_actions
  when 4 then  review_account
  when 5 then welcome_screen
  else
    puts "invalid selection"
    current_account_actions
  end

end

welcome_screen
