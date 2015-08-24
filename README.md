# freebsd-laptops

Ansible playbooks for automating the setup and use of laptop devices.

## Usage

```shell
% make plan
% make apply

# Or if you prefer the full ansible-playbook(1) syntax:
% ansible-playbook --check -s site.yml -e @config.yml # equivalent to `make plan`
% ansible-playbook         -s site.yml -e @config.yml # equivalent to `make apply`
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

* Support non-Lenovo T420 devices (i.e. add more `roles/laptop-*` plays)
* Add a poudriere for building ports specific to the config of your laptop
* Enable/disable features based on the kern.osreldate
* Setup and use other sane defaults (e.g. `openntpd` vs `xntpd`, `opensmtpd`,
  `ipfw`)
* Figure out a different way to query the hardware without `dmidecode`
* Remove default values from configuration files (`/boot/loader.conf`,
  `/etc/sysctl.conf`, `/etc/rc.conf`) that way the defaults can be adjusted
  over time and users inherit new defaults.
* Add a user's preferred username to `config.yml`
* Make sure the user's preferred username is a part of the `video` group.

## Desired Structure

1. `roles/laptop-*/meta/main.yml` has dependencies that pull in the
   pre-requisite roles necessary to enable `laptop-*`.  `laptop-*` passes the
   necessary parameters down to dependency ports.
2. Each of the roles pulled in from `laptop-*` and configure a sane set of
   defaults according to `config.yml` and the hardware contained within
   `laptop-*`.  If a default value is found in a config file, automatically
   remove the default value to allow configs to progress based on current,
   best advice.
