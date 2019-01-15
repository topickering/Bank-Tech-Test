# BANK TECHNICAL TEST

A tech test from week 10, Makers.

Written in Ruby (https://ruby-doc.org/)

## How to install the app

Fork this repository, and then clone into either an existing or new directory via the command line.

## Dependencies

The app uses the following gems:
- rspec for testing,
- timecop to help account for time in tests,
- simple-cov to assess test coverage,
- rubocop for linting.

Having cloned the repository and switched into the project directory from the command line, run
```
bundle install
```
in order to install these gems.

## Using the app

Once the repository has been cloned and gems installed, open an REPL environment, for example IRB:
```
irb
```

Load the app:
```
load 'lib/account.rb'
```

Now you can create an account via the command line:
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

## Running tests

Make sure dependencies are installed, then run rspec from the command line:
```
rspec
```
(For more information, visit http://rspec.info/.)

## Running the linter

Make sure dependencies are installed, then run rubocop from the command line:
```
rubocop
```

The linter can also be customised via the .rubocop.yml file.

(For more information, visit https://github.com/rubocop-hq/rubocop.)

## Approach

The app has four classes:

- Account: this class stores a balance and transactions, and is the controller class.
- Transaction: this class stores transaction amounts and dates.
- TransactionFormatter: this class formats transactions for a statement print-out.
- Statement: this class prints out a formatted history of transactions for an account.
