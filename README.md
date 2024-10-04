# attendace

A new Flutter project.

## Getting Started

Please use these command in command line to get started:

1. `dart pub global activate fvm` -> to install fvm to your main flutter installation, make sure fvm command can be run from command line after doing this, if not, add Pub/Cache/bin (not sure where, depends on OS and installation) to PATH env
2. `fvm use --force` -> to install correct flutter version for this project
3. `dart pub global activate melos` -> to install melos in system, make sure melos command can be run from command line after doing this, should be done if fvm (step 1 & 2) already setup properly
4. `melos bootstrap` -> to run flutter pub get for all available packages
5. remove .example from `.env.prod.example` and `.env.dev.example` , edit according to development environment and then run `./build_env.sh` to
   generate `.env` file
6. Perform [IDE Setup](#ide-setup)
7. Restart IDE
8. Use `Run and Debug` menu from each IDE, select which package to run, press run to run the app
9. `git config --local core.hooksPath .githooks/` -> to update git-hooks path to `/.githooks` so that it will run `.githooks/pre-commit` before execute git commit.
10. install mason to help with generate some of our boilerplate code. install it with `dart pub add mason`
11. run `mason get` to install mason that we already listed on `mason.yaml` files. run `mason ls` to check which mason that already installed on our machine

## FVM

### Updating Flutter Version

If you need to upgrade flutter version just in case because some library needs it, run `fvm use <version_number> --force` in root project terminal. for example `fvm use 3.10.5 --force`. Then notice all team member to run `fvm install` after they already pull latest changes.

### IDE Setup

For more complete guide or extra features, see this link: https://fvm.app/docs/getting_started/configuration/#ide

#### VSCode

- open or create settings.json in .vscode directory
- make sure to add these to the json config:

```json
{
  "dart.flutterSdkPath": ".fvm/flutter_sdk",
  // Remove .fvm files from search
  "search.exclude": {
    "**/.fvm": true
  },
  // Remove from file watching
  "files.watcherExclude": {
    "**/.fvm": true
  },
  "editor.codeActionsOnSave": {
    "source.fixAll": "explicit",
    "source.organizeImports": "explicit"
  }
}