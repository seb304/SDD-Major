

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
    let bestLabel: BestLabel

    enum CodingKeys: String, CodingKey {
        case bestLabel = "best_label"
    }
}

struct BestLabel: Codable {
    let prob: Double
    let name, id: String
}

struct Statistics: Codable {
    let processingTime: Double

    enum CodingKeys: String, CodingKey {
        case processingTime = "processing time"
    }
}

struct Status: Codable {
    let code: Int
    let text, requestID, procID: String

    enum CodingKeys: String, CodingKey {
        case code, text
        case requestID = "request_id"
        case procID = "proc_id"
    }
}
