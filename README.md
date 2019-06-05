# Bank Tech Test

A Makers tech test challenge completed in 2 days.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Getting started

```bash
> git clone git@github.com:shektor/bank-tech-test.git
> cd bank-tech-test
> bundle install
```

## Running tests

```bash
> rspec
```

Test coverage

```bash
> open coverage/index.html
```

Code linting

```bash
> rubocop
```

## How to use

```bash
bank-tech-test$ irb
2.6.0 :001 > require './lib/account'
 => true 
2.6.0 :002 > require './lib/transaction_log'
 => true 
2.6.0 :003 > require './lib/transaction'
 => true 
2.6.0 :004 > require './lib/transaction_statement'
 => true 
2.6.0 :005 > account = Account.new
 => #<Account:0x00007f9604906388 @balance=0.0, @transaction_log=#<TransactionLog:0x00007f9604906310 @log=[], @transaction=Transaction>, @transaction_statement=#<TransactionStatement:0x00007f9604906220 @header="date || credit || debit || balance\n">>
2.6.0 :006 > account.deposit(1000.00, '05-06-2019')
 => #<Transaction:0x00007f96048efc78 @credit=1000.0, @debit=0.0, @date="05-06-2019", @balance=1000.0> 
2.6.0 :007 > account.deposit(500.00, '05-06-2019')
 => #<Transaction:0x00007f960587ea90 @credit=500.0, @debit=0.0, @date="05-06-2019", @balance=1500.0> 
2.6.0 :008 > account.withdraw(2500.00, '05-06-2019')
Traceback (most recent call last):
        5: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/student/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):9
        1: from /Users/student/Documents/week-10/bank-tech-test/lib/account.rb:23:in `withdraw'
RuntimeError (Insufficient funds)
2.6.0 :009 > account.withdraw(1500.00, '05-06-2019')
 => #<Transaction:0x00007f9604967e80 @credit=0.0, @debit=1500.0, @date="05-06-2019", @balance=0.0> 
2.6.0 :010 > account.statement
date || credit || debit || balance
05-06-2019 ||  || 1500.00 || 
05-06-2019 || 500.00 ||  || 1500.00
05-06-2019 || 1000.00 ||  || 1000.00
 => nil
```

## User stories

```
As a makers employee
So that I can manage my money
I would like to create a bank account

So that I store my salary
I would like to deposit money into my account

So that I buy some whiteboard markers
I would like to withdraw money from my account

So that I have a record of my deposit or withdrawal
I would like to receive a receipt of transaction 

So that I can see my account history
I would like to print a log of transactions

So that I cannot buy the new Mac pro
I would like to recieve an error when I try to withdraw more than my balance
```

## Domain Model

![IMG_1803](https://user-images.githubusercontent.com/44544977/58958004-cbc5e180-8799-11e9-9afa-e05f775bb12b.PNG)
