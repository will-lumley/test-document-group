//
//  ContentViewModel.swift
//  Number
//
//  Created by William Lumley on 9/3/2024.
//

import Combine
import Foundation
import SwiftUI
import UniformTypeIdentifiers


@Observable final class ContentViewModel {

    public var number: Number

    init(number: Number = .init(value: 5)) {
        self.number = number
    }

    func incrementValue() {
        self.number.value += 1
    }

}

extension ContentViewModel: FileDocument {
    static var readableContentTypes: [UTType] { [.number] }
    
    public convenience init(configuration: ReadConfiguration) throws {
        // Decode the file content to your custom struct
        guard let data = configuration.file.regularFileContents else {
            throw CocoaError(.fileReadCorruptFile)
        }
        guard let decodedData = try? JSONDecoder().decode(Number.self, from: data) else {
            throw CocoaError(.fileReadCorruptFile)
        }

        let jsonStr = String(data: data, encoding: .utf8)
        print("JSON: \(jsonStr)")

        self.init(number: decodedData)
    }

    public func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        // Encode your custom struct to JSON
        let jsonData = try JSONEncoder().encode(self.number)
        // Return a file wrapper containing your document data
        return FileWrapper(regularFileWithContents: jsonData)
    }

}

extension UTType {
    static var number: UTType {
        UTType(exportedAs: "com.williamlumley.number.number")
    }
}
