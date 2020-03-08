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
            print("SWIFT")
        }

        if language == "ruby" {
            print("SWIFT")
        }
    }
}

VersionsCLI.main()
