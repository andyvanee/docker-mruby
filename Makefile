IMG=andyvanee/mruby

default:
	docker build -t $(IMG) .

shell:
	docker run -i -t $(IMG) bash

mirb:
	docker run -it $(IMG) mirb
