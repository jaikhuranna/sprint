//
//  HomePageCollectionViewCell.swift
//  Sprint
//
//  Created by admin19 on 24/03/25.
//

import UIKit

class HomePageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellBgView: UIView!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellBodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellBgView.layer.cornerRadius = 10
        cellBgView.clipsToBounds = true
        
        cellImageView.layer.cornerRadius = 10
        cellImageView.clipsToBounds = true
    }
}
