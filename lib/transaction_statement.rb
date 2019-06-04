class TransactionStatement
  HEADER_STRING = "date || credit || debit || balance\n"

  def initialize
    @header = HEADER_STRING
  end

  def print(log)
    string = @header
    log.each do |transaction|
      string += "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}\n"
    end
    puts string
  end
end
