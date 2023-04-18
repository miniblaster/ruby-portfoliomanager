# Finance Portfolio Application

The purpose of the Portfolio Manager is to allow a simple interface to capture account balances and provide basic reporting via the usage of graphs to track growth of each account over time using Ruby on Rails and ReactJS.

## Current System

The data structures and initial screen have been created. Currently the `Dashboard.jsx` component renders a ReactJS page with a table displaying the Accounts and their relevant balances for the dates between the select start and end date.

## Gems Required / Packages / Libraries

- Active Admin
- Devise
- React
- Postgres
- active model serilizer
- D3 Graphs
- Pundit

## Models

- User
  - A person that can login to the system
- Account
  - A model to relate an `UltimateBenecificaryOwner` to their `Balances`
- Tag
  - Accounts will be taggable with miscellaneous string values to be used for custom filters
- UltimateBenecificaryOwner
  - Sometimes in the industry refered to as UBO
  - The person/entity that an account is owned by
  - We differentiate between `Users` and `UltimateBenecificaryOwners` due to not every UBO being able to login to the system
- Balance
  - An amount for an `Account` on a date
- Currency
  - Model to hold currency data
  - Fields include;
    - name ("US Dollar", "Rand", "Euro", "Pound")
    - iso_name (`USD`, `ZAR`, `EUR`, `GBP`)
    - symbol ("$", "R", "€", "£")
- ExchangeRate
  - Conversion from one currency to another
  - Has a `from_currency` (currency being converted)
  - Has a `to_currency` (currency being converted to)
  - Has a `rate` (multiplier spread between from currency & to currency)
    - Example;
      - `USD` to `ZAR` rate of `18.86`
      - IE: $1 (US Dollar) = R18.86 (Rand)

## Account Creation Form

- Name
- Country
- Currency
- Users
- UBO
- Tags

## New Balance form

- Balance amount
- Account Name
- Balance date

### User Roles

Policies and Scopes (Pundit)

## D3 Graphs (https://d3-graph-gallery.com)

    Plot Graph (Time to Balance)
    Bar Graph (Time to Balance)
    Pie Chart (Account Balance to Portfolio)
    Stack Bar Graph (Time, Balance, Accounts)

#### Data table dashboard;

- Portfolio balance
- Account balances
- Percentage (%)
- Column logic (if postive green, negative red, no change yellow)

## Known Bugs

- Account Rows should always display even when no balance exist within the given date range for that particular account.
