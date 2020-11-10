import Foundation

enum RestError: Error {
    case statusCode(statusCode: Int)
    case logicError(error: Error)
}
