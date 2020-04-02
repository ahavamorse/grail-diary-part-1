//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by Ahava on 4/2/20.
//  Copyright © 2020 Ahava. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var numOfCluesLabel: UILabel!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let poi = poi else {
            return
        }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.county
        numOfCluesLabel.text = String(poi.clues.count)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
