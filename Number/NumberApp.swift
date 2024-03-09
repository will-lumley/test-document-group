//
//  NumberApp.swift
//  Number
//
//  Created by William Lumley on 9/3/2024.
//

import SwiftUI

@main
struct NumberApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: ContentViewModel()) { file in
            ContentView(viewModel: file.$document)
        }
    }
}
