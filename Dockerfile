FROM ruby:2.5

RUN gem install 'imap-backup' -v 3.3.1

CMD ["imap-backup"]
