//
//  ContentView.swift
//  testCodePractice
//
//  Created by 青山凱 on 2024/01/02.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var model: CountModel
    internal var didAppear: ((Self) -> Void)?
    
    var body: some View {
        
        VStack {
            Text("ボタンを押すと、値がカウントされるぞ！")
        }
        .onAppear { self.didAppear?(self) }
        
        VStack {
            Text("\(model.count)")
        }
        .padding()
        VStack {
            Button("タップ") {
                print("タップされました。")
                model.up()
            }
        }
    }
}

#Preview {
    ContentView(model: .init())
}
