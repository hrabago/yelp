//
//  BusinessCell.swift
//  Yelp
//
//  Created by Héctor Rábago on 2/7/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var reviewsCountLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var business: Business! {
        didSet{
            nameLabel.text = business.name
            thumbImageView.setImageWithURL(business.imageURL!)
            categoriesLabel.text = business.categories
            addressLabel.text = business.address
            distanceLabel.text = business.distance
            ratingImageView.setImageWithURL(business.ratingImageURL!)
            reviewsCountLabel.text = "\(business.reviewCount!) Reviews"
        
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbImageView.layer.cornerRadius = 5
        thumbImageView.clipsToBounds = true
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
