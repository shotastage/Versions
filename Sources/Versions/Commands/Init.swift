
import ArgumentParser
import ShellSwift

struct Init: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Initialize versions workspace"
    )

    func run() throws {
        print("This tool is now under construction that it has possibility of being unstable.")

        do {
            try Shell.run("echo", arguments: ["Hello"])
        }
        catch {
            print("Failed to execute internal command.")
        }
    }
}
