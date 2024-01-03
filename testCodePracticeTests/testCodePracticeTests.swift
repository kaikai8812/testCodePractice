//
//  testCodePracticeTests.swift
//  testCodePracticeTests
//
//  Created by 青山凱 on 2024/01/02.
//

import XCTest
import ViewInspector

@testable import testCodePractice

final class testCodePracticeTests: XCTestCase {


    func testInitView() throws {
        let sut = ContentView(model: .init())
        let descTesxt = try sut.inspect().vStack(0).text(0).string()
        print(descTesxt)
        XCTAssertTrue( descTesxt == "ボタンを押すと、値がカウントされるぞ！")
        
        let countText = try sut.inspect().vStack(1).text(0).string()
        print(countText)
        XCTAssertTrue(countText == "0")
    }

    //  いける。
    func testCount2() throws {
        var sut = ContentView(model: .init())
        
        let exp = sut.on(\.didAppear) { view in
            XCTAssertEqual(try view.actualView().model.count, 0)
            try view.find(button: "タップ").tap()  //  findで見つけちゃった方が楽
            XCTAssertEqual(try view.actualView().model.count, 1)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp])
    }
}
