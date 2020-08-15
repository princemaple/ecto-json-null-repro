FROM hexpm/elixir:1.10.3-erlang-23.0.2-alpine-3.11.6

RUN set -xe \
    && apk add -U inotify-tools build-base \
    && rm -rf /var/cache/apk/*

RUN mix local.hex --force && mix local.rebar --force

# phoenix app

WORKDIR /var/app

ARG MIX_ENV=prod
ENV MIX_ENV $MIX_ENV

COPY config /var/app/config
COPY mix.exs /var/app/mix.exs
COPY mix.lock /var/app/mix.lock

RUN mix do deps.get, deps.compile

COPY lib /var/app/lib
COPY priv /var/app/priv
COPY test /var/app/test

RUN mix compile

EXPOSE 4000

CMD ["elixir", "--sname", "app", "--cookie", "secret", "-S", "mix", "run", "--no-halt"]
