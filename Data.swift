//
//  Data.swift
//  Sprint
//
//  Created by Jai Khurana on 24/03/25.
//

import Foundation

class Data
{
    static var collections : [Collection] = []
    
    static let sampleData: [Collection] = [
        {
            let collection = Collection()
            
            let note1 = Note()
            note1.title = "Meeting Notes"
            note1.headerImage = "meeting_header.png"
            
            let heading1 = heading()
            heading1.type = .one
            heading1.text = "Project Kickoff"
            
            let body1 = Body()
            body1.text = "Discussed the roadmap and assigned tasks. and the following of it all should be looked at"
            
            let todo1 = TodoContent()
            todo1.task = "Send meeting summary"
            todo1.completed = false
            
            let image1 = ImageContent()
            image1.Image = "roadmap.png"
            
            note1.content = [heading1, todo1, body1, image1]
            
            let note2 = Note()
            note2.title = "Grocery List"
            
            let heading2 = heading()
            heading2.type = .two
            heading2.text = "Shopping List"
            
            let todo2 = TodoContent()
            todo2.task = "Buy milk"
            
            let todo3 = TodoContent()
            todo3.task = "Get vegetables"
            todo3.completed = true
            
            let todo4 = TodoContent()
            todo4.task = "Purchase bread"
            
            note2.content = [heading2, todo2, todo3, todo4]
            
            let note3 = Note()
            note3.title = "Daily Journal"
            note3.headerImage = "journal_cover.png"
            
            let heading3 = heading()
            heading3.type = .three
            heading3.text = "March 24, 2025"
            
            let body3 = Body()
            body3.text = "Today was productive. Completed most tasks!"
            
            let image3 = ImageContent()
            image3.Image = "sunrise"
            
            note3.content = [heading3, body3, image3]
            
            collection.notes = [note1, note2, note3]
            
            return collection
        }()
    ]



}
