import APIService
import Hummingbird
import OpenAPIHummingbird
import OpenAPIRuntime

struct APIServiceImpl: APIProtocol {    
    func healthCheck(_: APIService.Operations.healthCheck.Input) async throws -> APIService.Operations.healthCheck.Output {
        .ok(.init())
    }
}
