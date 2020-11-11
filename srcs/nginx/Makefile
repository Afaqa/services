NAME = nginx
VER = kubed

all:
	@echo "MAKE: build, run"

build:
	docker build . -t $(NAME):$(VER)

run:
	docker run --rm -p 443:443 -p 80:80 -td $(NAME):$(VER) --name $(NAME)

exec:
	docker exec -it $(NAME)-$(VER) sh

rm:
	docker stop	$(NAME):$(VER)
	docker rmi $(NAME):$(VER)
