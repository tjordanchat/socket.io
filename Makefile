ALL_TESTS = $(shell find test/ -name '*.test.js')
ALL_BENCH = $(shell find benchmarks -name '*.bench.js')

run-tests:
	./node_modules/.bin/expresso \
		-t 3000 \
		-I support \
		--serial \
		$(TESTS)

test:
	$(MAKE) NODE_PATH=lib TESTS="$(ALL_TESTS)" run-tests
	find 

test-cov:
	TESTFLAGS=--cov $(MAKE) test

test-leaks:
	ls test/leaks/* | xargs node  --expose_gc

run-bench:
	node $(PROFILEFLAGS) benchmarks/runner.js

bench:
	$(MAKE) BENCHMARKS="$(ALL_BENCH)" run-bench

profile:
	PROFILEFLAGS='--prof --trace-opt --trace-bailout --trace-deopt' $(MAKE) bench

