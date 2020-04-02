//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by Ahava on 4/2/20.
//  Copyright © 2020 Ahava. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

    private func updateViews() {
        guard let poi = poi else {
            return
        }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.county
        cluesTextView.text = ""
        for clue in poi.clues {
            cluesTextView.text += "- \(clue)\n"
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
