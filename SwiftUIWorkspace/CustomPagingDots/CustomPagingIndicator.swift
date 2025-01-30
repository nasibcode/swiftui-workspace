//
//  ContentView.swift
//  SwiftUIWorkspace
//
//  Created by Nasib Ali Ansari on 30/01/25.
//

import SwiftUI

struct CustomPagingIndicator: View {
    @State private var currentPage: Int = 0
    let totalPages: Int = 10 // Example: Total number of pages
    
    var body: some View {
        VStack {
            // Content (e.g., TabView or ScrollView)
            TabView(selection: $currentPage) {
                ForEach(0..<totalPages, id: \.self) { page in
                    Text("Page \(page + 1)")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .tag(page)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 200)
            
            // Custom Paging Indicator
            HStack(spacing: 10) {
                ForEach(visiblePageRange(), id: \.self) { page in
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(page == currentPage ? .blue : .gray)
                        .animation(.easeInOut, value: currentPage)
                        .onTapGesture {
                            withAnimation {
                                currentPage = page
                            }
                        }
                }
            }
            .padding(.top, 10)
        }
        .padding()
    }
    
    // Calculate the range of visible dots
    private func visiblePageRange() -> [Int] {
        let visibleDots = 5
        let halfVisible = visibleDots / 2
        
        var start = currentPage - halfVisible
        var end = currentPage + halfVisible
        
        // Adjust range if near the start or end
        if start < 0 {
            start = 0
            end = min(visibleDots - 1, totalPages - 1)
        } else if end >= totalPages {
            end = totalPages - 1
            start = max(end - (visibleDots - 1), 0)
        }
        
        return Array(start...end)
    }
}
