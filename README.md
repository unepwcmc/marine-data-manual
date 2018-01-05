# Marine Data Manual

## Tech

- Ruby 2.4.1
- Rails 5.1.4
- Vue
- Vuex

## Local development

- Clone repo
- `bundle install`
- `yarn install`
- `rails s`

## Importing data

- Import metadata rake task
- `rake import:metadata['lib/data/seed/marine-data-manual-2018-01-05-utf8.csv']`
- Check logs to see any errors
