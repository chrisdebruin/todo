FROM elixir:1.5

ENV PHOENIX_VERSION 1.3.0

# install mix archive
RUN mix local.hex --force \
    && mix local.rebar --force \
    && mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs inotify-tools \
    && apt-get clean

WORKDIR /code

EXPOSE 4000

CMD ["mix", "phx.server"]
