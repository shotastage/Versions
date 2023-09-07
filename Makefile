build:
	swift build
xcodeproj:
	swift package generate-xcodeproj
clean:
	@rm -rf .build/
	@rm -rf Versions.xcodeproj/
	@rm .xcode-version
	@rm -rf .swiftpm/
.PHONY: format
format:
	swiftformat --config .swiftformat Sources/ Tests/
