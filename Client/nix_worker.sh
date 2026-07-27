#!/usr/bin/env nix
#! nix shell --impure --expr ``
#! nix with (import (builtins.getFlake ''nixpkgs'') {}); [
#! nix git gcc gnumake cargo
#! nix (python3.withPackages (ps: with ps; [ requests psutil py-cpuinfo ]))
#! nix ]
#! nix ``
#! nix --command bash

set -euo pipefail

source ../.env
export OPENBENCH_{USERNAME,PASSWORD,SERVER}

python client.py -T "$OPENBENCH_THREADS" -I "$OPENBENCH_MACHINE_NAME" -N 1
