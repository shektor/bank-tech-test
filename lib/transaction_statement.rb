class TransactionStatement
  HEADER_STRING = "date || credit || debit || balance\n"

  def initialize
    @header = HEADER_STRING
  end

  def print(log)
    puts stringify(log)
  end

  private

  def stringify(log)
    combined_string = @header
    log.each { |transaction| combined_string += format(transaction) }
    combined_string
  end

  def format(transaction)
    string = "#{transaction.date} || "
    string += "#{two_dp_or_blank(transaction.credit)} || "
    string += "#{two_dp_or_blank(transaction.debit)} || "
    string += "#{two_dp_or_blank(transaction.balance)}\n"
  end

  def two_dp_or_blank(value)
    return '' if value.zero?
    '%.2f' % value
  end
end
