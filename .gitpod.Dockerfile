FROM elixir AS builder
RUN git clone https://github.com/dragonwasrobot/i18n-to-elm /build
WORKDIR /build
RUN mix local.hex --force
RUN MIX_ENV=prod mix build 
RUN ls


FROM gitpod/workspace-full
COPY --from=builder /build/i18n2elm /workspace