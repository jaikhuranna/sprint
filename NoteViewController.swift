//
//  NoteViewController.swift
//  Sprint
//
//  Created by Jai Khurana on 24/03/25.
//

import UIKit

class NoteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Data.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let block = Data.collections[0].notes[0].content[indexPath.row]
        print(block)
        return UITableViewCell()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
