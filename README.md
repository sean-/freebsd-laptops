# freebsd-laptops

Ansible playbooks for automating the setup and use of laptop devices.

## Usage

```shell
% ansible-playbook -s site.yml
```

This assumes `sysutils/ansible` has been installed already.

## Installation

```shell
sudo pkg install sysutils/ansible
```

## Debugging

```shell
% ansible -m setup -s localhost
```

## TODO

* Support non-Lenovo T420 devices
* Add a poudriere for building ports specific to the config of your laptop
* Enable/disable features based on the kern.osreldate
* Setup and use other sane defaults (e.g. openntpd vs xntpd, opensmtpd, ipfw)
* Allow users to somehow specify preferences and user-specified defaults
  (e.g. ipfw vs pf)
* Switch from using `library/sysrc` to lineinfile for sysrc-style updates.
* Improve `library/kld` to not return changed when a module is already
  loaded.
