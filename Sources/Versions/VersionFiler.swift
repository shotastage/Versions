import Foundation

class VersionFiler {
    let fileManager = FileManager.default

    func xcodeVersion() {
        let ver = Version(of: "xcodebuild -version").sliceLine(of: 1).register(rule: "[throw] [number]").number

        write(file: URL(fileURLWithPath: ".xcode-version"), text: ver)
    }

    func swiftVersion() {
        let ver = Version(of: "swift --version").sliceLine(of: 1).register(rule: "[throw] [number]").number

        write(file: URL(fileURLWithPath: ".swift-version"), text: ver)
    }

    /*
     func rubyVersion() {
         write(file: URL(fileURLWithPath: ".ruby-version"), text: ver)
     }
     */

    @discardableResult
    private func write(file: URL, text: String) -> Bool {
        guard let stream = OutputStream(url: file, append: true) else {
            return false
        }
        stream.open()

        defer {
            stream.close()
        }

        guard let data = text.data(using: .utf8) else { return false }

        let result = data.withUnsafeBytes {
            stream.write($0, maxLength: data.count)
        }
        return (result > 0)
    }

    /**
     Remove specified file

     - Parameter for: Remove target file
     - Returns: Result true:Success / false:Fail
     */
    @discardableResult
    private func prepare(for removePath: String) -> Bool {
        do {
            try fileManager.removeItem(atPath: removePath)
        } catch {
            return false
        }

        return true
    }
}
