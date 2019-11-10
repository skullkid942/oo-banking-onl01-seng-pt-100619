require "pry"
class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 
  
  def valid?
    @sender.valid?
    @receiver.valid?
  end
  
  def execute_transaction
     if (@sender.balance > @amount) && (self.valid?) && (status == "pending")
       #binding.pry 
      @sender.deposit( @amount * -1 ) 
      @receiver.deposit( @amount )
      @status = "completed"
    else
      return "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end 
  
end
