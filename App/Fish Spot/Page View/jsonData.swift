
import Foundation

struct XimilarData: Codable {
    let records: [Record]
    let version: Int
    let modelFormat, taskID: String
    let status: Status
    let statistics: Statistics

    enum CodingKeys: String, CodingKey {
        case records, version
        case modelFormat = "model_format"
        case taskID = "task_id"
        case status, statistics
    }
}

struct Record: Codable {
    let bestLabel: Label
    let status: Status

    enum CodingKeys: String, CodingKey {
        case bestLabel = "best_label"
        case status = "_status"
    }
}

struct Label: Codable {
    let prob: Double
    let name, id: String
}

struct Status: Codable {
    let code: Int
    let text, requestID: String
    let procID: String?

    enum CodingKeys: String, CodingKey {
        case code, text
        case requestID = "request_id"
        case procID = "proc_id"
    }
}

struct Statistics: Codable {
    let processingTime: Double

    enum CodingKeys: String, CodingKey {
        case processingTime = "processing time"
    }
}
