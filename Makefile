all: pip-login

pip-login:
	aws codeartifact login --tool pip --repository trovata-pypi --domain trovata-domain --domain-owner 697856758640
	python -m pip install --upgrade pip

twine-login:
	pip install --upgrade twine
	aws codeartifact login --tool twine --repository trovata-pypi --domain trovata-domain --domain-owner 697856758640

publish: pip-login twine-login
	python setup.py sdist bdist_wheel
	twine upload --repository codeartifact dist/*

