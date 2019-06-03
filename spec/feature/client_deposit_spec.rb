# frozen_string_literal: true

require 'bank'

describe 'Client deposit' do
  it 'can deposit money at bank' do
    bank = Bank.new
    expect(bank.deposit(1000.00)).to eq 1000.00
  end
end
