NAME = influxdb
VER = kubed

all:
	@echo "MAKE: build, run, exec, rm"

build:
	docker build . -t $(NAME):$(VER)

run:
	docker run --name $(NAME) --rm -p 8086:8086 -td $(NAME):$(VER)

exec:
	docker exec -it $(NAME) sh

rm:
	docker stop	$(NAME)
	docker rmi $(NAME):$(VER)
