import ArgumentParser

struct VersionsCLI: ParsableCommand {

    @Argument(help: "Specify language")
    var language: String

    @Flag(help: "Include a counter with each repetition.")
    var includeCounter: Bool

    @Option(name: .shortAndLong, help: "The number of times to repeat 'phrase'.")
    var count: Int?

    func run() throws {
        if language == "swift" {
            let out = Shell.bash("swift --version")
            print(out)
        }

        if language == "ruby" {
            let out = Shell.bash("ruby -v")
            print(out)
        }

        if language == "python" {
            let out = Shell.bash("python -V")
            print(out)
        }

        if language == "go" {
            let out = Shell.bash("go version")
            print(out)
        }

        if language == "node" {
            let out = Shell.bash("node -v")
            print(out)
        }    

        if language == "xcode" {
            let out = Shell.bash("xcodebuild -version")
            print(out)
        }        
    }
}

VersionsCLI.main()
