#!/bin/bash

cd app/attendance

../../.fvm/flutter_sdk/bin/flutter build apk --release --obfuscate --split-debug-info=build/flutter_mapping

cd ../..
