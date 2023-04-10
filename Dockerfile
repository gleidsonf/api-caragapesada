FROM elixir:1.14.3-alpine

RUN apk --update add postgresql-client
RUN apk add inotify-tools

RUN mix local.rebar --force
RUN mix local.hex --force

RUN mkdir /app
WORKDIR /app

CMD ["/app/entrypoint.sh"]
