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
* Add poudriere for building ports specific to the config of your laptop
