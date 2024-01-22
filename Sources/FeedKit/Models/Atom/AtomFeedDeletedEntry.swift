//
//  AtomFeedDeletedEntry.swift
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

import Foundation

/// The at:deleted-entry element represents an Atom Entry that has been removed.
public class AtomFeedDeletedEntry {
    
    /// The element's attributes.
    public class Attributes {
        
        /// The at:deleted-entry element MUST contain a "ref" attribute whose
        /// value specifies the value of the atom:id of the entry that has been
        /// removed.
        public var ref: String?
        
        /// The at:deleted-entry element MUST contain a "when" attribute whose
        /// value is an [RFC3339] "date-time", specifying the instant the entry
        /// was removed.
        public var when: Date?
        
    }
    
    /// The element's attributes.
    public var attributes: Attributes?
    
    /// The at:deleted-entry element MAY contain one at:by element used to
    /// identify the entity that removed the entry.  The at:by element is an
    /// Atom Person Construct as defined by Section 3.2 of [RFC4287].
    public var by: AtomFeedAuthor?
    
    /// The at:deleted-entry element MAY contain one at:comment element whose
    /// value provides additional, language-sensitive information about the
    /// deletion operation.  The atom:comment element is an Atom Text
    /// Construct as defined by Section 3.1 of [RFC4287].
    public var comment: String?
    
    public init() { }
    
}


// MARK: - Initializer

extension AtomFeedDeletedEntry {
    
    convenience init(attributes attributeDict: [String : String]) {
        self.init()
        self.attributes = AtomFeedDeletedEntry.Attributes(attributes: attributeDict)
    }
    
}


extension AtomFeedDeletedEntry.Attributes {
    
    convenience init?(attributes attributeDict: [String : String]) {
        
        if attributeDict.isEmpty {
            return nil
        }
        
        self.init()
        
        self.ref = attributeDict["ref"]
        self.when = attributeDict["when"]?.toPermissiveDate()
        
    }
    
}


// MARK: - Equatable

extension AtomFeedDeletedEntry: Equatable {
    
    public static func == (lhs: AtomFeedDeletedEntry, rhs: AtomFeedDeletedEntry) -> Bool {
        return
            lhs.attributes == rhs.attributes &&
            lhs.by == rhs.by &&
            lhs.comment == rhs.comment
    }
    
}


extension AtomFeedDeletedEntry.Attributes: Equatable {
    
    public static func == (lhs: AtomFeedDeletedEntry.Attributes, rhs: AtomFeedDeletedEntry.Attributes) -> Bool {
        return
            lhs.ref == rhs.ref &&
            lhs.when == rhs.when
    }
    
}
