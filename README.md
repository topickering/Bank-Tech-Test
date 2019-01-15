# BANK TECHNICAL TEST

A tech test from week 10, Makers.

Written in Ruby (https://ruby-doc.org/)

## How to install the app

Fork this repository, and then clone into either an existing or new directory via the command line.

## Dependencies

The app uses the following gems:
- rspec for testing,
- simple-cov to assess test coverage,
- rubocop for linting.

Run
```
bundle install
```
in order to install these gems.

## Using the app

Create an account via the command line:
```
account = Account.new
```

Make a deposit:
```
account.deposit(1000)
```

Make a withdrawal:
```
account.withdraw(500)
```
(Note that you cannot withdraw more than the account balance - no overdrafts here!)

Check your balance:
```
account.balance
```

See your transaction history:
```
account.print_statement
```
