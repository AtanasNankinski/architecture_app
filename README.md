## Installation and Usage

Due to the generated files not being pushed to the git repository in order to build the project a build_runner command must be called first.

Either run this command for one time build:
```bash
dart run build_runner build --delete-conflicting-outputs
```

Or this one to watch for changes and build when such are detected:
```bash
dart run build_runner watch --delete-conflicting-outputs
```
