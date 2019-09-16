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

- rails db:create db:migrate
- Import metadata rake task
There are two types of csv, one for global stats such as:(`oceanplus-library-22Aug2019-global.csv`) and another for regional stats such as:(`oceanplus-library-08Aug2019-regional.csv`), both should be imported with the same rake task named import_metadata.rake, an example import would be:
- `rake import:metadata[lib/data/seed/oceanplus-library-11Sep2019-regional.csv,regional]`
- Check logs to see any errors
