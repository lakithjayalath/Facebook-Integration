//
//  DetailViewController.swift
//  Facebook Integration
//
//  Created by Lakith Jayalath on 2022-04-20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var catImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var hotelTitle: String?
    var hotelDescription: String?
    var imageURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI(title: hotelTitle, description: hotelDescription, imageURL: imageURL)
    }
    
    func setUpUI(title: String?, description: String?, imageURL: URL?) {
        titleLabel.text = title
        descriptionLabel.text = description
        placeImage(url: imageURL)
    }
    
    func placeImage(url: URL?) {
        catImageView.kf.indicatorType = .activity
        catImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "cat"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }

}
