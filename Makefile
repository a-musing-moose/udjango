.PHONY: test update format

test:
	@rapyd pytest --mypy

update:
	@rapyd pip install -r /app/requirements/dev.txt

format:
	@rapyd yapf -ri -vv -e **/dev.py .
	@rapyd isort -y -rc .

static:
	@rapyd mypy --ignore-missing-imports .
