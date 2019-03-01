#!/bin/bash
$(
cat << EOF | xargs echo apm install
atom-ctags
busy-signal
intentions
linter
linter-gcc2
linter-ui-default
EOF
)
