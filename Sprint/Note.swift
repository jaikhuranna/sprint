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
    var fontSize : Int?
}

// Markdown Defintions
class Body : MarkdownContent
{
    override var fontSize: Int? {
        didSet
        {
            fontSize = 16;
        }
    }
}

class heading : MarkdownContent
{
    enum order
    {
        case one;
        case two;
        case three;
    }
    var type : order = .one;
    
    override var fontSize: Int? {
        didSet
        {
            switch type
            {
            case .one:
                fontSize = 32;
            case .two:
                fontSize = 24;
            case .three:
                fontSize = 18;
            }
        }
    }
}
