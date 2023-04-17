# Finance Portfolio Application 

A system to replace excel spreadshreet (example) by using a form capture of balances over periods of time. <br>
An interactive dashboard to display captured balances and other database queries 

## Account Creation Form 
- Name
- Country 
- Currency
- Users
- UBO
- Tags 

## Input form 
  Balance amount 
  Account Name
  Balance date 

### User Roles 
  Policies and Scopes (Pundit)

### Dashboard 
    Selector Selected currency 
      - (convert all values via exchange model to selected currency using releative date exchange rate)
    Button `New Balance`
    Button `New Account` 
## D3 Graphs (https://d3-graph-gallery.com)
    Plot Graph (Time to Value)
    Bar Graph (Time to Value)
    Pie Chart (Account Balance to Portfolio)
    Stack Bar Graph (Time,Value, Accounts)
#### Data table showing;
  Portfolio balance 
  Account balances 
  Exchange Rates () 
  Percentage (%) change over period
    Column logic (if postive green, negative red, no change yellow)

## Gems Required / Packages / Libraries
Active Admin 
Devise 
React 
Postgres
active model serilizer 
D3 Graphs

## Models 
- User (A person that can login to the system)
- Account 
- Tag
- UBO (Ultimate Benecificary Owner)
    - `Portfolio` (All accounts associated with UBO)
- Balance (`Amount` for an `Account` on a date)
- Currency
- ExchangeRate (Conversion from one currency to another)  

UBO.first.portfolio = List of accounts for UBO 