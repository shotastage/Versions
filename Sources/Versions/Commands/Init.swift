import Foundation
import ArgumentParser
import ShellSwift

struct Init: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Initialize versions workspace"
    )

    func run() throws {

        let fileName = "Versionfile"
        let content = "# Versionfile - 0.1 -\n"

        do {
            let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
            let fileURL = currentDirectoryURL.appendingPathComponent(fileName)

            try content.write(to: fileURL, atomically: true, encoding: .utf8)
            print("\(fileName) has been created.")
        } catch {
            print("Error has been occured: \(error)")
        }

        
        let out = Shell.directoryRun("echo This command is now under construction.")
        print(out)
    }
}
