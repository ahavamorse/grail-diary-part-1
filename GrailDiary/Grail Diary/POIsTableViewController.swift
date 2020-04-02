//
//  ViewController.swift
//  Grail Diary
//
//  Created by Ahava on 3/30/20.
//  Copyright © 2020 Ahava. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var placesOfInterest: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let viewController = segue.destination as? AddPOIViewController {
                viewController.delegate = self
                
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let viewController = segue.destination as? POIDetailViewController  {
                viewController.poi = placesOfInterest[indexPath.row]
            }
        }
    }


}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesOfInterest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            fatalError("Not a POITableViewCell")
        }
        cell.poi = placesOfInterest[indexPath.row]
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        placesOfInterest.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
