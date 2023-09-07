import ArgumentParser

@main
struct MainCLI: ParsableCommand {
    static let configuration: CommandConfiguration = {
        CommandConfiguration(
            commandName: "versions",
            abstract: "Multiple toolchain version fixer",
            version: "0.0.1",
            subcommands: [
                Init.self
            ],
            defaultSubcommand: Init.self
        )
    }()
}
