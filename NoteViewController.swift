//
//  NoteViewController.swift
//  Sprint
//
//  Created by Jai Khurana on 24/03/25.
//

import UIKit

class NoteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var notesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Data.collections
        
        notesTableView.dataSource = self
        notesTableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(Data.sampleData[0].notes[0].content.count)
        return Data.sampleData[0].notes[0].content.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = Data.sampleData[0].notes[0] // Assuming a single collection
        let contentItem = note.content[indexPath.row]

           if let todoContent = contentItem as? TodoContent,
              let cell = tableView.dequeueReusableCell(withIdentifier: "TodoContentViewCell", for: indexPath) as? TodoContentTableViewCell {
               cell.taskTextView.text = todoContent.task
               print(todoContent.task)
               return cell
               
           }

           if let markdownContent = contentItem as? MarkdownContent,
              let cell = tableView.dequeueReusableCell(withIdentifier: "MarkdownContentViewCell", for: indexPath) as? MarkdownContentTableViewCell {
               cell.textView.text = markdownContent.text
               cell.textView.font = UIFont.systemFont(ofSize: CGFloat(markdownContent.fontSize))
               return cell
           }

           if let imageContent = contentItem as? ImageContent,
              let cell = tableView.dequeueReusableCell(withIdentifier: "ImageContentViewCell", for: indexPath) as? ImageContentTableViewCell {
               cell.UIImageView.image = UIImage(named: imageContent.Image)
               cell.UIImageView.layer.cornerRadius = 12
               return cell
           }

           // Default cell if no match
           let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        cell.textLabel?.text = "Unknown Content"
        return cell
    }
    
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Assuming a single collection and note for this example.
        let note = Data.sampleData[0].notes[0] // Assuming a single collection
        let contentItem = note.content[indexPath.row]
        
        switch contentItem {
        case let textContent as MarkdownContent:
            let fontSize = CGFloat(textContent.fontSize ?? 16)
            let text = textContent.text ?? " "  // Ensure non-empty text
            let constrainedWidth = tableView.frame.width - 40 // Adjust based on your layout margins
            let textHeight = text.height(withConstrainedWidth: constrainedWidth, font: UIFont.systemFont(ofSize: fontSize))
            // Add padding (20) and enforce a minimum height of 30
            return max(textHeight + 20, 30)
            
        case let todoContent as TodoContent:
            let fontSize: CGFloat = 16  // Use a default font size for the task
            let text = todoContent.task.isEmpty ? " " : todoContent.task // Avoid zero height if empty
            let constrainedWidth = tableView.frame.width - 40
            let textHeight = text.height(withConstrainedWidth: constrainedWidth, font: UIFont.systemFont(ofSize: fontSize))
            return max(textHeight + 20, 30)
            
        case let imageContent as ImageContent:
            if let image = UIImage(named: imageContent.Image) {
                let aspectRatio = image.size.height / image.size.width
                return tableView.frame.width * aspectRatio // Keeps the image's aspect ratio
            }
            return 200  // Fallback height if image is not found
            
        default:
            return 44 // Default height for any unknown content type
        }
    }

    
    override func viewDidAppear(_ animated: Bool) {
        notesTableView.reloadData()
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [.font: font],
                                            context: nil)
        return ceil(boundingBox.height)
    }
}
