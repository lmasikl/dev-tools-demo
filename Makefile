.PHONY: migrate
migrate:
	@poetry run python devtoolsdemo/manage.py migrate

.PHONY: shell
shell:
	@poetry run python devtoolsdemo/manage.py shell

.PHONY: runserver
runserver:
	@poetry run python devtoolsdemo/manage.py runserver

.PHONY: flake8
flake8:
	@poetry run pflake8

.PHONY: isort
isort:
	@poetry run isort .

.PHONY: black
black:
	@poetry run black .

.PHONY: update-requirements
update-requirements:
	@poetry update
	@poetry export --without-hashes -f requirements.txt --output requirements.txt

.PHONY: docker-build
docker-build:
	@docker build -t devtoolsdemo -f Dockerfile .
