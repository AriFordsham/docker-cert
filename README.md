# Docker wrapper script for custom SSL certificates

This script imports the set of SSL scripts from the host machine into arbitrary Docker containers without needing to rebuild them. This is useful when your network requires custom SSL certificates.  

It currently supports applications using OpenSSL - please file an issue if an application doesn't work.

Just copy the `docker` script into your `$PATH` - feel free to rename. The script handles conflicts with the existing `docker` binary.

This should work with existing tools that call `docker`, including compiled programs.