# ripytide's dotfiles
Here in this humble box full of files lies my beloved configs for my computer system.
You are more than welcome to take inspiration from these dotfiles, after all I took lots of inspiration from others to produce them.

## how it works
The dotfiles themselves live in the folder called **actual** where **actual** is emulating the home folder that the dotfiles would normally live.
For example, my neovim configs live in **dotfiles/actual/.config/nvim**.

All my machines use the default branch of the repo, **main**. Differences in configs between machines are achieved using custom **enviroment-style** variables
using the syntax **!variableNameHere** in any config file. The values that the variables get replaced with are stored in the **.toml** files on the top-level of the repo.

Once satisfied with the variables/dotfiles then I then run **./compile.sh {tomlFileNameHere}** which would copy all the dotfiles from **actual** to my home directory and
then replace all the **enviroment-style** variables using the values stored in the given toml file.
For example if I was installing my dotfiles on my laptop it would look something like this:
```
git clone https://github.com/ripytide/dotfiles
cd dotfiles
./compile muncher
```
(*muncher is the name of my laptop*)
## main programs
- bspwm
- sxhkd
- rofi
- key-mapper
- xscreensaver
- kitty
- firefox
- neovim
- udiskie
- fish
- dunst
