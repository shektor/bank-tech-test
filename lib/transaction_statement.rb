# frozen_string_literal: true

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
    statement_array = [@header]
    log.reverse.each do |transaction|
      statement_array.push(format_each(transaction))
    end
    statement_array.join
  end

  def format_each(transaction)
    [
      "#{transaction.date} || ",
      "#{two_dp_or_blank(transaction.credit)} || ",
      "#{two_dp_or_blank(transaction.debit)} || ",
      "#{two_dp_or_blank(transaction.balance)}\n"
    ].join
  end

  def two_dp_or_blank(value)
    return '' if value.zero?

    format('%.2f', value)
  end
end
