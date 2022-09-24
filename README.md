# README

Get moving fast with Rails

## Ruby version
3.1.2

## Ruby dependencies
- Administrate
- Devise
- Dotenv
- Factory Bot
- Honeybadger
- OJ
- Pagy
- Ransack
- Redis
- Sendgrid
- Sidekiq
- Skylight

## Asset dependencies
- Bootstrap
- Bootswatch (optional)
- Bootstrap Icons
- Hotwire
- Stimulus

## Configuration
Set these environment variables. Use a .env for development/test:

- `DEFAULT_HOST`

- `HONEYBADGER_API_KEY` (optional in development/test)
- `REDIS_URL` (optional in development/test)
- `SENDGRID_API_KEY` (optional in development/test)
- `SIDEKIQ_URL` (optional in development/test)
- `SKYLIGHT_AUTHENTICATION` (optional in development/test)

- `DATABASE_URL` (production only)

## Database initialization
`rails db:create`
`rails db:schema:load`

## App initialization
`bundle install`
`yarn`

## How to run the test suite
`rails test`

## Services (job queues, cache servers, search engines, etc.)
- Redis server (optional in development/test)

## How to run the dev server
`./bin/dev`

## Deployment instructions

