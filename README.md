# dcos-vbox

Run DC/OS with a Windows agent on local VM's.

## DC/OS

Requires:
- a Windows Vagrant box called `windows_server_1709_docker_virtualbox.box`. Run `vagrant box add windows_server_1709_docker_virtualbox.box`.
- a DC/OS installer file called `dcos_generate_config.sh` in `dcos-vbox/bootstrap`.
- a DC/OS Windows installer files called `dcos_generate_config_win.sh` in `dcos-vbox/bootstrap`.

Start cluster with `./open-create.sh` and destroy with `destroy.sh`.

## DC/OS Enterprise

Requires:
- a Windows Vagrant box called `windows_server_1709_docker_virtualbox.box`. Run `vagrant box add windows_server_1709_docker_virtualbox.box`.
- a DC/OS installer file called `dcos_generate_config.ee.sh` in `dcos-vbox/bootstrap-ee`.
- a DC/OS Windows installer files called `dcos_generate_config_win.ee.sh` in `dcos-vbox/bootstrap`.
- a DC/OS Enterprise license file in `dcos-vbox/bootstrap-ee/genconf/license.txt`

Start cluster with `./ee-create.sh` and destroy with `destroy.sh`.

## Using

To run commands on the Windows machine, change to the `windows` directory and use `vagrant winrm`.
By default, this uses PowerShell.
For Command Prompt commands use `vagrant winrm -s cmd -c 'dir'`.
