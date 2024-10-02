#!/bin/bash

FILENAME="brew_programs_list.txt"

# To (export) list all currently installed apps
brew list > $FILENAME
echo "Currently installed apps:"
cat $FILENAME

# To install brew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# To install all apps from the export
# xargs brew install < $FILENAME