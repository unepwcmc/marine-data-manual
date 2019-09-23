# Marine Data Manual

## Tech

- Ruby 2.4.1
- Rails 5.1.4
- Vue
- Vuex

## Local development

- Clone repo
- Request an `.env` file from the team
- `bundle install`
- `yarn install`
- `rails s`

## Importing data

- rails db:create db:migrate
- Import metadata rake task
- bundle exec rake import:metadata[lib/data/seed/oceanplus-library-22Aug2019-global.csv,global]
- bundle exec rake import:metadata[lib/data/seed/oceanplus-library-18Sep2019-regional.csv,regional]
- Check logs to see any errors
