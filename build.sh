#!/usr/bin/env bash

#exit if any command fails
set -e

msbuild GeoAPI.sln "/t:Restore;Build" /p:Configuration=Release "/p:FrameworkPathOverride=$(dirname $(which mono))/../lib/mono/4.5/" /v:minimal /p:WarningLevel=3
mono ./testrunner/NUnit.Runners.3.6.0/tools/nunit-console.exe ./test/GeoAPI.Tests/bin/Release/net45/GeoAPI.Tests.dll
