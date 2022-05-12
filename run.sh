#! /usr/bin/env nix-shell
#! nix-shell -i bash

source ".venv_$(uname)/bin/activate"

cd litesata_axiom || true
./litesata_axiom.py --port=0 --gen=2 --build --load
