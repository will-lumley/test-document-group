//
//  ContentView.swift
//  Number
//
//  Created by William Lumley on 9/3/2024.
//

import SwiftUI

struct ContentView: View {

    @Binding var viewModel: ContentViewModel

    var body: some View {
        VStack {
            Text("Number Value: \(viewModel.number.value)")

            Button("Increment!") {
                viewModel.incrementValue()
            }
        }
    }
}
