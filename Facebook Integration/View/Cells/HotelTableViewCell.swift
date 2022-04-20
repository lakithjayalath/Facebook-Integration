//
//  HotelTableViewCell.swift
//  Facebook Integration
//
//  Created by Lakith Jayalath on 2022-04-20.
//

import UIKit
import Kingfisher

class HotelTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var catImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // setting the table view cell ui
    func onBindCell(hotelData: HotelData) {
        titleLabel.text = hotelData.title
        addressLabel.text = hotelData.address
        placeImage(url: URL(string: hotelData.image.small))
    }
    
    // loading image to image view
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
