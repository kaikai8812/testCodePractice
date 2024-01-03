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
        let sut = ContentView()
        let descTesxt = try sut.inspect().vStack(0).text(0).string()
        print(descTesxt)
        XCTAssertTrue( descTesxt == "ボタンを押すと、値がカウントされるぞ！")
        
        let countText = try sut.inspect().vStack(1).text(0).string()
        print(countText)
        XCTAssertTrue(countText == "0")
    }
    
    //  tapの後も、coutが2にならず、テストが失敗する
//    func testCount() throws {
//        try XCTContext.runActivity(named: "static string") { _ in
//            let sut = ContentView()
//            let countText = try sut.inspect().vStack(1).text(0).string()
//            XCTAssertTrue(countText == "0")
//            print(countText)
//            try sut.inspect().vStack(2).button(0).tap()  // タップ自体は成功しているけど、更新がまだか？
//            let countText2 = try sut.inspect().vStack(1).text(0).string()
//            print(countText2)
//            XCTAssertTrue(countText2 == "1")
//        }
//    }
    
    //  いける。
    func testCount2() throws {
        var sut = ContentView()
        
        let exp = sut.on(\.didAppear) { view in
            XCTAssertEqual(try view.actualView().count, 0)
//            try view.vStack(2).button(0).tap()
//            try view.vStack(2).find(button: "タップ").tap()
            try view.find(button: "タップ").tap()  //  findで見つけちゃった方が楽
            XCTAssertEqual(try view.actualView().count, 1)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp])
    }
}
