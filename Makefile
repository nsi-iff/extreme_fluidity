all: test

deps: specloud should-dsl fluidity

specloud:
	@python -c 'import specloud' 2>/dev/null || pip install --no-deps specloud -r https://github.com/hugobr/specloud/raw/master/requirements.txt

should-dsl:
	@python -c 'import should_dsl' 2>/dev/null || pip install -e git+https://github.com/hugobr/should-dsl.git#egg=should_dsl

fluidity:
	@python -c 'import fluidity' 2>/dev/null || pip install -e git+https://github.com/nsi-iff/fluidity.git#egg=fluidity-sm

test: deps
	@echo =======================================
	@echo ========= Running unit specs ==========
	@specloud spec
	@echo

