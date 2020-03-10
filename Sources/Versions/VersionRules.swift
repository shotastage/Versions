//
//  VersionRules.swift
//  ArgumentParser
//
//  Created by Shota Shimazu on 2020/03/10.
//

import Foundation

// Commandline Regex
//
// ex. 
// $ swift version
// >> Apple Swift version 5.1.3 (swiftlang-1100.0.282.1 clang-1100.0.33.15)
// ↑ is equal to 
// [throw] [throw] [throw] [version] [build]
// and extracted
// 5.1.3
class VersionOf {
    
    let cmdOut: String?

    var rule: String?

    init(_ cmd: String) {
        cmdOut = Shell.bash(cmd)
    }
    
    var number: String {

        let ruleBlock = rule!.components(separatedBy: " ")

        let cmdOutes = rule!.components(separatedBy: " ")

        for (index, out) in cmdOutes.enumerated() {
            print(index, out)
        }

        return cmdOut!
    }

    func register(rule: String) -> Self {
        self.rule = rule

        return self
    }
}
