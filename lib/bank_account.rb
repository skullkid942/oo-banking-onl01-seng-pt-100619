class BankAccount
  
  attr_reader :name
  attr_accessor :balance, :status
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end 
  
  def display_balance
    "Your balance is $#{self.balance}."
  end 
  
  def deposit(amount)
    self.balance += amount
  end 
  
  def valid?
    if (@status == "open" && @balance > 0)
      return true 
    else 
      return false 
    end 
  end
  
  def close_account
    self.status = "closed"
  end 
  
  
end
