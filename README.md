# getdep.sh -- Get dependencies for Ubuntu packages

Tested on Ubuntu 16.04 and Ubuntu 18.04.

Meant for gathering all dependencies (as .deb packages) in advance on a same-version VM or workstation. Then transfer the output tarball with all the required packages to the target machine.

NOTE: Change the `$TARGET` variable in `getdep.sh` as needed. This instance grabs everything you need for `bcmwl-kernel-source` (Broadcom WiFi driver needed for many common WiFi adapters.)

Allows for installation of `$TARGET` package and all dependencies without networking on a target machine.

**INSTRUCTIONS TO 'GETDEP' FROM A NETWORKED MACHINE:**

- `$ git clone https://github.com/84adam/getdep.git`
- From the `getdep/` directory, make `getdep.sh` executable: `$ chmod +x getdep.sh`
- `Then run it: `$ ./getdep.sh`

NOTE: The final two scripts you need on the target machine are copied into the directory and tarred up together. This allows you to be able to copy only 1 file via USB or other media to the target machine.

**INSTRUCTIONS TO INSTALL PACKAGE/DEPENDENCIES ON TARGET MACHINE:**

After you've copied over the tarball onto the target machine, run the following to install all the pre-downloaded dependencies for the `$TARGET` package:

- `$ chmod +x install_all.sh`
- `$ sudo ./install_all.sh`
- `$ chmod +x check_install.sh`
- `$ ./check_install.sh`
