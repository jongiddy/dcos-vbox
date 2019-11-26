# dcos-vbox

Run DC/OS with a Windows agent on local VM's.

Requires:
- a Windows Vagrant box called `windows_server_1709_docker_virtualbox.box`. Run `vagrant box add windows_server_1709_docker_virtualbox.box`.
- a DC/OS installer file called `dcos_generate_config.sh` in `dcos-vbox/bootstrap` [download link](https://downloads.dcos.io/dcos/testing/master/dcos_generate_config.sh).
- a DC/OS installer Windows file called `dcos_generate_config_win.sh` in `dcos-vbox/bootstrap` [download link](https://downloads.dcos.io/dcos/testing/master/windows/dcos_generate_config_win.sh).

To run commands on the Windows machine, use `vagrant winrm`. By default, this uses PowerShell. For Command Prompt commands use `vagrant winrm -s cmd -c 'dir'`.
