# Dotfiles

Use git repository to backup and restore configuration files (dotfiles).

This utility assumes that the files to install were put in `$HOME/.dotfiles`

## Usage

- Use `bootstrap.sh` to creaty symbolic link at `$HOME/.dotfiles`
- Use `install.sh` to install files from `$HOME/.dotfiles` to home folder.

## Note

`.bashrc` file is no longer provided, as that most Linux distribution will
build with a well designed `.bashrc` for new user account. Most setting in
my `.bashrc` is moved to `.bashrc.d/common.bash` file, and the original
`.bashrc` is moved to `ignores` folder for memorization.

As that `.bashrc` is removed, users need to add the followings into `.bashrc`
by hand for the settings in `.bashrc.d/*.bash` to work.

``` bash
# Source definitions within $HOME/.bashrc.d folder
for file in $HOME/.bashrc.d/*.bash; do
  source "$file"
done
```

Also, it's recommended to add followings to `.bash_profile` to source `.bashrc`
automatically in login shell.

``` bash
if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi
```
