install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv --cov=main --cov=mylib test_*.py

format:	
	black *.py 

lint:
	pylint --disable=R,C --ignore-patterns=test_.*?py *.py mylib/*.py

container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

refactor: format lint

IMAGE ?= ghcr.io/rowshanattar/startup-game
TAG   ?= $(shell git rev-parse --short HEAD)

build:
	docker build -t $(IMAGE):$(TAG) -t $(IMAGE):latest .

deploy: build
	docker push $(IMAGE):$(TAG)
	docker push $(IMAGE):latest
		
all: install lint test format deploy
