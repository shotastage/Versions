//
//  VersionRules.swift
//  ArgumentParser
//
//  Created by Shota Shimazu on 2020/03/10.
//

import Foundation
import ShellSwift

// Commandline Regex
//
// ex.
// $ swift version
// >> Apple Swift version 5.1.3 (swiftlang-1100.0.282.1 clang-1100.0.33.15)
// ↑ is equal to
// [throw] [throw] [throw] [version] [build]
// and extracted
// 5.1.3
class Version {
    var cmdOut: String?

    var rule: String?

    init(of: String) {
        cmdOut = "version: 2.8" // Temp placeholder
    }

    var number: String {
        let ruleBlock = rule!.components(separatedBy: " ")

        let cmdOutes = cmdOut!.components(separatedBy: " ")

        var tmpString: String = ""

        for (index, out) in cmdOutes.enumerated() where ruleBlock[index] != "[throw]" {
            tmpString += out
        }

        return tmpString
    }

    func sliceLine(of: Int) -> Self {
        cmdOut = cmdOut!.components(separatedBy: .newlines)[of - 1]

        return self
    }

    func register(rule: String) -> Self {
        self.rule = rule

        return self
    }
}
