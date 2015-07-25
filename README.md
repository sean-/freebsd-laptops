# freebsd-laptops

Ansible playbooks for automating the setup and use of laptop devices.

## Usage

```shell
% ansible-playbook -s site.yml
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
