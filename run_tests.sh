#!/bin/bash
xcodebuild -workspace SampleProject.xcworkspace -scheme SampleProject -sdk iphonesimulator7.1 test | xcpretty -c && exit ${PIPESTATUS[0]}
