#! /usr/bin/env nix-shell
#! nix-shell -i bash

set -x

if [ -e ".venv_$(uname)" ]; then
    shouldSetup=0
else
    shouldSetup=1
fi
echo $shouldSetup

if [ "$shouldSetup" == "1" ]; then
    python -m venv ".venv_$(uname)"
fi
source ".venv_$(uname)/bin/activate"

if [ "$shouldSetup" == "1" ]; then
    # https://github.com/enjoy-digital/litesata_axiom
    if [ ! -e litex_setup.py ]; then
	wget https://raw.githubusercontent.com/enjoy-digital/litex/master/litex_setup.py
    fi
    chmod +x litex_setup.py
    ./litex_setup.py init install
    
    git clone --recursive https://github.com/enjoy-digital/litesata_axiom
fi
`which bash` ./run.sh
