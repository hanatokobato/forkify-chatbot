FROM ruby:2.5.8-alpine

ENV GEM_HOME /app/vendor/bundle
ENV BUNDLE_PATH /app/vendor/bundle
ENV BUNDLE_BIN /app/vendor/bundle/bin
ENV PATH $BUNDLE_BIN:$BUNDLE_PATH/gems/bin:$PATH

RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME"
RUN gem install bundler:2.1.4

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

COPY ./wait-for-it.sh /
RUN chmod +x /wait-for-it.sh

WORKDIR /app

RUN addgroup -g 1000 appgroup

RUN adduser -D -u 1000 appuser -G appgroup

RUN chown -R appuser:appgroup /app

USER appuser
