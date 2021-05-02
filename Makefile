REGISTRY=ghcr.io/elwin
VERSION=3.3.1
NAME=imap-backup

build:
	docker build -t imap-backup .

publish:
	docker tag $(NAME) $(REGISTRY)/$(NAME):$(VERSION)
	docker push $(REGISTRY)/$(NAME):$(VERSION)