build:
	swift build
xcodeproj:
	swift package generate-xcodeproj
clean:
	rm -rf .build/
	rm -rf Versions.xcodeproj/
