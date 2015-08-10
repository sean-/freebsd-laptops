LINES_TO_SHOW=14

.MAIN: default

apply:: config.yml
	ansible-playbook -s site.yml -e @config.yml

config.yml:	config.yml.sample
	@if [ -e config.yml -a config.yml.sample -nt config.yml ]; then \
		printf '\n\tNOTICE: config.yml is out of date compared to config.yml.sample.\n' ; \
		printf '\tEither `touch config.yml` or update config.yml accordingly.\n\n' ; \
		printf '\tTo see the changes: diff -u config.yml.sample config.yml\n\n' ; \
	else \
		/bin/cp -np config.yml.sample config.yml || exit 0 ; \
	fi

default::
	@/usr/bin/head -n $(LINES_TO_SHOW) README.md

deps::
	/usr/local/bin/sudo /usr/local/bin/pkg install -y sysutils/ansible

help::
	@printf 'Supported make(1) targets:\n\n'
	@printf '\tplan	- run a (hopefully) non-destructive check\n'
	@printf '\tapply	- apply config changes (if any)\n'
	@printf '\tdeps	- install dependencies (i.e. ansible)\n'

plan:: config.yml
	ansible-playbook -s site.yml -e @config.yml --check
