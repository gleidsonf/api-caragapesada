FROM elixir:1.14.3-alpine

RUN apk --update add postgresql-client
RUN apk add inotify-tools
# equivalent to `build-essential` in ubuntu
RUN apk --update add build-base

RUN mix local.rebar --force
RUN mix local.hex --force

RUN mkdir /app
WORKDIR /app

CMD ["/app/entrypoint.sh"]
