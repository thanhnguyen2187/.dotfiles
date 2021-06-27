if command -v npm >/dev/null 2>&1; then
    export PATH=$(npm prefix -g)/bin:$PATH
fi

