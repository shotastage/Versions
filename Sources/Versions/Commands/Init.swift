
import ArgumentParser
import ShellSwift

struct Init: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Initialize versions workspace"
    )

    func run() throws {
        let out = Shell.directoryRun("echo This command is now under construction.")
        print(out)
    }
}
