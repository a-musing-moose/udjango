.PHONY: test update format

test:
	@./rapyd pytest

update:
	@./rapyd pip install -r /app/requirements/dev.txt

format:
	@./rapyd yapf -ri -vv .
	@./rapyd isort -y -rc .
