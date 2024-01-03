//
//  CountModel.swift
//  testCodePractice
//
//  Created by 青山凱 on 2024/01/03.
//

import Foundation
import Combine

class CountModel: ObservableObject {
    @Published var count: Int = 0
    
    func up() {
        self.count += 1
    }
}
