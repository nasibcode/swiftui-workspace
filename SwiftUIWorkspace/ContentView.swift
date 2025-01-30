//
//  ContentView.swift
//  SwiftUIWorkspace
//
//  Created by Nasib Ali Ansari on 30/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Custom Paging Indicator") {
                    CustomPagingIndicator()
                }
            }
            .navigationBarTitle("Home")
        }
    }
}

#Preview(body: {
    ContentView()
})
