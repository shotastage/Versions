
import ArgumentParser

struct Init: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Initialize versions workspace"
    )

    func run() throws {
        print("This tool is now under construction that it has possibility of being unstable.")

        Shell.shell(launchPath: "echo", arguments: ["now under construction..."])
    }
}
