# Set Editor
if test -n "$SSH_CONNECTION"
    set -gx EDITOR nano
else
    set -gx EDITOR code
    set -gx VISUAL code
end

# Set Locale
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# Set Timezone
set -gx TZ America/Chicago

# Initial Paths
set PATH /usr/local/sbin $PATH
set PATH ~/.local/bin $PATH

if test -d /etc/paths
    set PATH (cat /etc/paths | tr "\\n" ":" | sed 's/:$//')
end

# Homebrew
if type -q brew
    set HOMEBREW_CASK_OPTS '--appdir=/Applications'
    set PATH (brew --prefix coreutils)/libexec/gnubin $PATH
end

# Yarn
if type -q yarn
    set PATH ~/.config/yarn/global/node_modules/.bin ./node_modules/.bin $PATH
end

# Composer
if type -q composer
    set PATH ~/.composer/vendor/bin ./vendor/bin $PATH
end

# Cargo
if type -q cargo
    set PATH ~/.cargo/bin $PATH
end

# Hub
if type -q hub
    eval (hub alias -s)
end
