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
- `rake import:metadata['lib/data/seed/OceanPlusLibrary-MetadataList-9Mar2019.csv']`
- Check logs to see any errors
