#!/bin/bash
xcodebuild -workspace SampleProject.xcworkspace -scheme SampleProject -sdk iphonesimulator test | xcpretty -c && exit ${PIPESTATUS[0]}
