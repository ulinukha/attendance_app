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
```

#### Android Studio

- Every time you open the project, make sure you change “Flutter SDK” path to <RootProject>/.fvm/flutter_sdk
- see link above to exclude .fvm/flutter_sdk from being scanned by IDE

## Adding New Asset

### Add assets at `components` package

New common assets should be placed at `components` package and following steps:

1. Put the asset in `<package_path>/assets/raw/...` there are folders:
   - `/svg` -> used for storing .svg files which will be compiled to .vec for faster loading and rendering
   - `/svg_no_compile` -> used for storing .svg files which don't need compilation
   - `/images` -> used for storing .png files
2. Run `melos compile_assets`
3. New directory `assets/compiled` will be generated which contains compiled files
4. `<package_name>_assets.dart` will be generated at `libs/src` which contains paths for the assets
5. Your assets is ready to use by accessing the enums at `<package_name>Assets.dart`

### Add assets at other package

If you wish to add assets on specific package, you can follow bellow steps.<br />
Add bellow dependencies on the pubspec.yaml:

- dependencies:
  - ait_tool_flutter_asset_manager
  - ait_design_system
- dev_dependencies:
  - vector_graphics_compiler

And then follow steps on `components` package above.<br />
And don't forget to included `<package>/assets/compiled/` folder as assets.

```yaml
flutter:
  assets:
    - assets/compiled/
```

### Using assets

use `DesignImage`, with parameter constant from assets

## FAQ

- Q: can't run, why?\
  A:
  - check `melos bootstrap`, is it success? should have `- xx package bootstrapped` at the end of script execution, if there is none, check script execution output, there should be some errors, see other FAQ for the resolution
  - check `fvm flutter --version`, it should contains same version as flutterSdkVersion inside `.fvm/fvm_config.json`. if not same, retry `fvm use --force`, if still same, remove fvm cache, use `fvm list` to get its cache directory
  - Compile error, check below for available FAQ
- Q: Melos bootstrap error, with message "Because `aaaa` depends on `bbbb` any which doesn't exist (authentication failed), version solving failed.", how to resolve?\
  A: ask devops teams to invite you into https://akarinti.jetbrains.space/ . They will send you registration link in email (check inbox and spam). After you have access to it, follow this link to create and use jetbrains space token for flutter https://aitadmin.sharepoint.com/:w:/s/AITDevelopers/EQ-KIp9W_gVNl1eS08IJY_sByBH9CSfO-CDqjndBVF63Uw?e=61HYBw
- Q: Melos bootstrap error, `blablabla is not recognized as an internal or external command` , or `no such file or directory`, why?\
  A: Melos doesn't support directory with space
- Q: Compile error `Error: 'Blablabla' isn't a type` how to resolve?\
  A:
  - check which package `Blablabla` is coming from
  - update all pubspec.yaml containing that package to its latest version
    for example: `ait_design_system` pubspec.yaml version set to `^1.8.1`, now exist `1.12.2`, update it to `^1.12.2`
  - rerun `melos bootstrap`
