//
//  Add.swift
//
//
//  Created by Shota Shimazu on 2023/09/08.
//

import Foundation
import ArgumentParser
import ShellSwift

struct Add: ParsableCommand {
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

    private func extractSwiftVersion(from string: String) -> String? {
        let pattern = "Apple Swift version (\\d+\\.\\d+\\.\\d+)"
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: string.utf16.count)

        if let match = regex?.firstMatch(in: string, options: [], range: range) {
            if let range = Range(match.range(at: 1), in: string) {
                return String(string[range])
            }
        }

        return nil
    }
}
