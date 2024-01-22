//
//  DeletedEntryTests.swift
//
//  Copyright (c) 2023 Naufal Fachrian
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import XCTest
import FeedKit

class DeletedEntryTests: BaseTestCase {
    
    func testMinimalDeletedEntry() {
        
        let URL = fileURL("MinimalDeletedEntry", type: "xml")
        let parser = FeedParser(URL: URL)
        
        do {
            
            let feed = try parser.parse().get().atomFeed
            
            XCTAssertEqual(feed?.deletedEntries?.last?.attributes?.ref, "tag:example.org,2005:/entries/1")
            
        } catch {
            XCTFail(error.localizedDescription)
        }
        
    }
    
    func testExtendedDeletedEntry() {
        
        let URL = fileURL("ExtendedDeletedEntry", type: "xml")
        let parser = FeedParser(URL: URL)
        
        do {
            
            let feed = try parser.parse().get().atomFeed
            
            XCTAssertEqual(feed?.deletedEntries?.last?.attributes?.ref, "tag:example.org,2005:/entries/2")
            XCTAssertEqual(feed?.deletedEntries?.last?.by?.name, "John Doe")
            XCTAssertEqual(feed?.deletedEntries?.last?.by?.uri, nil)
            XCTAssertEqual(feed?.deletedEntries?.last?.by?.email, "jdoe@example.org")
            XCTAssertEqual(feed?.deletedEntries?.last?.comment, "Removed comment spam")
            
        } catch {
            XCTFail(error.localizedDescription)
        }
        
    }
    
}
