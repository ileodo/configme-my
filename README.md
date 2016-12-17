# configme
configme is a configuration framework for multi-env and mutli-machines.

## Structure
There are three levels of the configurations. `share` -> `env` -> `local`

### share
You can define the shared configuration for all environments and machines in `share` folder.

After calling `share/install.sh`:

- a symbolic link `._share` (respecting to the config `SHARE_PATH`) will be created in the home folder and point to `share`.
- **mirror directories** will be created for all the sub-directories in `share/dotfiles` recursively.
- all the files in `share/dotfiles`, including the files in the sub-directory of `share/dotfiles`, will have **mirror symbolic links** the corresponding directories under home directory.
- all sub-directories under `share/dotfolders` (non-recursively) will have **mirror directoroes**.

### envs
You can define different environments in this directory by creating sub-directory.

For instance, if you create a sub-directory `envs/macos`:

- `macos` will be a valid option for envs selection.
- by calling `envs/install.sh macos`, a **symbolic link** `._env` (respecting to the config `ENV_PATH`) will be created in the home folder and point to `envs/macos`.
- if `init.sh` exists in the `envs/macos`, it will be excuted when calling `envs/install.sh macos`.

### locals
You can define different configurations for different machines in this directory by creating sub-directory.

For instance, if you create a sub-directory `locals/macpro`:

- `macpro` will be a valid option for locals selection.
- by calling `locals/install.sh macpro`, a **symbolic link** `._local` (respecting to the config `LOCAL_PATH`) will be created in the home folder and point to `locals/macpro`.
- if `init.sh` exists in the `locals/macpro`, it will be excuted when calling `envs/install.sh`.

## Configuration
You can change the configuration in `utils/config.sh`:

```bash
# symbolic for share
SHARE_PATH=~/._share

# symbolic for env
ENV_PATH=~/._env

# symbolic for local
LOCAL_PATH=~/._local

```

## Usage

Please see https://github.com/ileodo/configme-my as an example of this framework.
