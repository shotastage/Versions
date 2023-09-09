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
        let out = Shell.directoryRun("swift --version")
        
        if let version = extractSwiftVersion(from: out) {
            addVersionLine(toolchain: "swift", version: extractSwiftVersion(from: version)!)
        } else {
            print("Failed to detect toolchain version.")
        }
        
    }

    private func addVersionLine(toolchain: String, version: String) {
        StrUtil.appendText("\(toolchain)=\(version)", toFile: "Versionfile")
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
