REPORTER = dot

test:
	./node_modules/.bin/mocha \
		--reporter $(REPORTER) \
		--slow 200ms \
		--bail
	echo finished...

