import ArgumentParser
import Foundation

/*
struct VersionsCLI: ParsableCommand {
    @Argument(help: "Specify language")
    var language: String

    func readVersinfiles() {
        let file = FileHandle(forReadingAtPath: "./Versionfile")!
        let data = file.readDataToEndOfFile()
        let dataString = String(data: data, encoding: .utf8)!
        file.closeFile()

        for line in dataString.components(separatedBy: .newlines) where line != "\n" {
            switch line {
            case "xcode":
                VersionFiler().xcodeVersion()
            case "swift":
                VersionFiler().swiftVersion()
            default:
                _ = "None"
            }
        }
    }

    func run() throws {
        if language == "swift" {
            let out = Shell.bash("swift --version")

            let vers = out.components(separatedBy: " ")

            print(vers[3])
        }

        if language == "ruby" {
            let out = Shell.bash("ruby -v")

            let vers = out.components(separatedBy: " ")

            print(vers[1])
        }

        if language == "python" {
            let ver = Version(of: "python -V").number

            print(ver)
        }

        if language == "go" {
            let ver = Version(of: "go version").register(rule: "[throw] [throw] +go[number] [throw]").number

            print(ver)
        }

        if language == "node" {
            let ver = Version(of: "node -v").register(rule: "+v[number]").number

            print(ver)
        }

        if language == "xcode" {
            // let ver = Version(of: "xcodebuild -version").sliceLine(of: 1).register(rule: "+Xcode[number]").number

            let ver = Version(of: "xcodebuild -version").sliceLine(of: 1).register(rule: "[throw] [number]").number

            print(ver)
        }

        if language == "make" {
            readVersinfiles()
        }
    }
}
*/
// VersionsCLI.main()
