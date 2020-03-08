//
//  CLI.swift
//  ArgumentParser
//
//  Created by Shota Shimazu on 2020/03/08.
//
import Foundation

class Shell {

    @discardableResult
    static func shell(launchPath: String, arguments: [String]) -> String {
        let task = Process()
        task.launchPath = launchPath
        task.arguments = arguments

        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: String.Encoding.utf8)!
        if output.count > 0 {
            //remove newline character.
            let lastIndex = output.index(before: output.endIndex)
            return String(describing: output[output.startIndex ..< lastIndex])
        }
        return output
    }

    @discardableResult
    static func bash(_ cmdString: String) -> String {

        let commands: [String] = cmdString.components(separatedBy: " ")

        let whichPathForCommand = Shell.shell(launchPath: "/bin/bash", arguments: [ "-l", "-c", "which \(commands[0])" ])
        return Shell.shell(launchPath: whichPathForCommand, arguments: Array(commands.suffix(commands.count - 1)))
    }
}

