//
//  ContentView.swift
//  testCodePractice
//
//  Created by 青山凱 on 2024/01/02.
//

import SwiftUI

struct ContentView: View {
    
    @State var count: Int = 0
    internal var didAppear: ((Self) -> Void)?
    
    var body: some View {
        
        VStack {
            Text("ボタンを押すと、値がカウントされるぞ！")
        }
        .onAppear { self.didAppear?(self) }
        
        VStack {
            Text("\(count)")
        }
        .padding()
        VStack {
            Button("タップ") {
                print("タップされました。")
                count += 1
            }
        }
    }
}

#Preview {
    ContentView()
}
