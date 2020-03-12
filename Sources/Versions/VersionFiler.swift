import Foundation

class VersionFiler {
    func xcodeVersion() {
        let fileManager = FileManager.default
        let result = fileManager.createFile(atPath: ".xcode-version", contents: nil, attributes: nil)
        let ver = Version(of: "xcodebuild -version").sliceLine(of: 1).register(rule: "[throw] [number]").number

        write(file: URL(fileURLWithPath: ".xcode-version"), text: ver)
    }

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
}
