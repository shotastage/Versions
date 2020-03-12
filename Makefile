build:
	swift build
xcodeproj:
	swift package generate-xcodeproj
clean:
	rm -rf .build/
	rm -rf Versions.xcodeproj/
	rm .xcode-version

.PHONY: format
format:
	swiftformat --config .swiftformat Sources/ Tests/
