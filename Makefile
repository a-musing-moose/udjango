.PHONY: test update format static behave build

test:
	@rapyd pytest

update:
	@rapyd pip install -r /app/requirements/local.txt

format:
	@rapyd yapf -ri -vv .
	@rapyd isort -y -rc -vb .

static:
	@rapyd mypy --ignore-missing-imports .

behave:
	@rapyd behave --format json.pretty

build:
	docker build -t moose/udjango .
