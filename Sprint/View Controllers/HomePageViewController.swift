//
//  HomePageViewController.swift
//  Sprint
//
//  Created by admin19 on 24/03/25.
//

import UIKit

class HomePageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var addCollectionButton: UIImageView!
    @IBOutlet weak var homePageCollectionView: UICollectionView!
    @IBOutlet weak var addNewCollection: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homePageCollectionView.backgroundColor = .clear
        bgView.backgroundColor = .clear
        
        // Set up gradient background.
        let gradientView = UIView(frame: view.bounds)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradientView)
        view.sendSubviewToBack(gradientView)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.systemPurple.withAlphaComponent(0.3).cgColor,
            UIColor.clear.cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.5)
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
        
        homePageCollectionView.delegate = self
        homePageCollectionView.dataSource = self
        
        // Enable interaction
        addNewCollection.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addNewCollectionTapped))
        addNewCollection.addGestureRecognizer(tapGesture)
    }
    
    @objc func addNewCollectionTapped() {
        performSegue(withIdentifier: "goToNote", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 0
        return UICollectionViewCell()
    }
    

}
