# freebsd-laptops

Ansible playbooks for automating the setup and use of laptop devices.

## Usage

```shell
% make plan
% make apply

# Or if you prefer the full ansible-playbook(1) syntax:
% ansible-playbook --check -s site.yml -e @config # equivalent to `make plan`
% ansible-playbook -s site.yml -e @config.yml     # equivalent to `make apply`
```

## Customization

```shell
# To customize the defaults:
% cp config.yml{.sample,}
% $(EDITOR) config.yml
% ansible-playbook -s site.yml -e @config.yml
```

## Installation

To make use of this repository, you must install `sudo` and `ansible`:

```shell
# pkg install security/sudo
# pkg install sysutils/ansible
```

## Debugging

```shell
% ansible -m setup -s localhost
% ansible -vvv -m setup -s localhost
```

## TODO

* Support non-Lenovo T420 devices
* Add a poudriere for building ports specific to the config of your laptop
* Enable/disable features based on the kern.osreldate
* Setup and use other sane defaults (e.g. openntpd vs xntpd, opensmtpd, ipfw)
* Figure out a different way to query the hardware without `dmidecode`
