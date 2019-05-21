# InfraIssues

## Setup

- `cp config/database.yml.sample config/database.yml`
- Configure username and password in `config/database.yml` for `test` and `development`
- Install ruby if you haven't already:
  - `\curl -sSL https://get.rvm.io | bash -s stable --ruby`
- Install PostgreSQL >= 9.4 if you haven't already
- Install node >= 8.9 and yarn >= 1.12
- Run `bin/setup`
- Profit

## Running server

- `rails server`
- Go to `http://localhost:3000`
