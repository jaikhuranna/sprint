//
//  TodoContentTableViewCell.swift
//  Sprint
//
//  Created by Jai Khurana on 24/03/25.
//

import UIKit

class TodoContentTableViewCell: UITableViewCell {

    @IBOutlet var taskTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func checkButtonTapped(_ sender: Any) {
        
    }
    
}
