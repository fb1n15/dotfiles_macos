echo 'Hello from .zshenv'

function exists() {
  # `command -v` is similar to `which`
  command -v $1 >/dev/null 2>&1
}