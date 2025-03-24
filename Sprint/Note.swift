//
//  Markdown.swift
//  Sprint
//
//  Created by Jai Khurana on 24/03/25.
//

import Foundation

class Note
{
    let id : UUID = UUID()
    var title : String = "default"
    var headerImage : String?
    var content : [Content] = []
}

class Content
{
}

class TodoContent : Content
{
    let id : UUID = UUID()
    var task : String = ""
    var completed : Bool = false
    var date : Date?
}


class ImageContent : Content
{
    var Image : String = "sunrise"
}

class MarkdownContent : Content
{
    var text : String?
    var fontSize : Int = 16
}

// Markdown Defintions
class Body: MarkdownContent {
    override init() {
        super.init()
        self.fontSize = 16
    }
}


class heading: MarkdownContent {
    enum Order {
        case one, two, three
    }
    
    var type: Order {
        didSet {
            updateFontSize()
        }
    }
    
    override init() {
        self.type = .one // Default value
        super.init()
        updateFontSize()
    }
    
    private func updateFontSize() {
        switch type {
        case .one:
            fontSize = 32
        case .two:
            fontSize = 24
        case .three:
            fontSize = 18
        }
    }
}
