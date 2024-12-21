import ArgumentParser
import Hummingbird
import OpenAPIHummingbird
import OpenAPIRuntime

@main
struct HummingbirdAPIService: AsyncParsableCommand {
  @Option(name: .shortAndLong)
  var hostname = "127.0.0.1"

  @Option(name: .shortAndLong)
  var port = 8080

  func run() async throws {
    let router = Router()
    router.middlewares.add(LogRequestsMiddleware(.info))

    let api = APIServiceImpl()
    try api.registerHandlers(on: router)

    let app = Application(
      router: router,
      configuration: .init(address: .hostname(hostname, port: port))
    )

    try await withThrowingDiscardingTaskGroup { group in
      group.addTask {
        try await app.runService()
      }
    }
  }
}
