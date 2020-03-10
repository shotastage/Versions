//
//  VersionRules.swift
//  ArgumentParser
//
//  Created by Shota Shimazu on 2020/03/10.
//

import Foundation

class VersionOf {
    
    let cmdOut: String?

    init(_ cmd: String) {
        cmdOut = Shell.bash(cmd)
    }
    
    var number: String {
        return cmdOut!
    }
}
