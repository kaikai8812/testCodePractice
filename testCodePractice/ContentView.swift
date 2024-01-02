//
//  ContentView.swift
//  testCodePractice
//
//  Created by 青山凱 on 2024/01/02.
//

import SwiftUI

struct ContentView: View {
    
    @State var count: Int = 0
    
    var body: some View {
        VStack {
            Text("\(count)")
        }
        .padding()
        
        Button.init("タップ！") {
            count += 1
        }
    }
}

#Preview {
    ContentView()
}
