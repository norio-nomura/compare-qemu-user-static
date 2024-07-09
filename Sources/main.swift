import ArgumentParser

@main
struct Main: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "hello-world",
        abstract: "A 'Hello, world!' program written in Swift.",
        version: "1.0.0",
        subcommands: [SayHello.self],
        defaultSubcommand: SayHello.self
    )
}

extension Main {
    struct SayHello: ParsableCommand {
        static var configuration = CommandConfiguration(
            commandName: "say-hello",
            abstract: "Prints 'Hello, world!' to the console."
        )

        func run() {
            print("Hello, world!")
        }
    }
}
