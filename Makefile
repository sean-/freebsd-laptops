LINES_TO_SHOW=14

.MAIN: default

apply:: config.yml
	ansible-playbook -s site.yml -e @config.yml

config.yml:	config.yml.sample
	/bin/cp -np config.yml.sample config.yml

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
