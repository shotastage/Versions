//
//  StrUtil.swift
//  
//
//  Created by Shota Shimazu on 2023/09/10.
//

import Foundation


class StrUtil {
    static func appendText(_ text: String, toFile fileName: String) {
        let fileManager = FileManager.default
        let currentDirectoryURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)
        let fileURL = currentDirectoryURL.appendingPathComponent(fileName)

        do {
            var existingContent = ""
            if fileManager.fileExists(atPath: fileURL.path) {
                existingContent = try String(contentsOf: fileURL, encoding: .utf8)
            }

            let newContent = existingContent + text

            try newContent.write(to: fileURL, atomically: true, encoding: .utf8)
            print("Text has been added to \(fileName).")
        } catch {
            print("Error has been occured: \(error)")
        }
    }
}
