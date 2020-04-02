//
//  AddPOIViewController.swift
//  Grail Diary
//
//  Created by Ahava on 4/2/20.
//  Copyright © 2020 Ahava. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationTextField.delegate = self
        countryTextField.delegate = self
        clue1TextField.delegate = self
        clue2TextField.delegate = self
        clue3TextField.delegate = self
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text,
            let country = countryTextField.text else { return }
        
        var poi = POI(location: location, county: country, clues: [])
        
        if let clue1 = clue1TextField.text {
            poi.clues.append(clue1)
        }
        
        if let clue2 = clue2TextField.text {
            poi.clues.append(clue2)
        }
        
        if let clue3 = clue3TextField.text {
            poi.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(poi)
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

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let text = textField.text,
            !text.isEmpty {
            
            switch textField {
            case locationTextField:
                countryTextField.becomeFirstResponder()
            case countryTextField:
                clue1TextField.becomeFirstResponder()
            case clue1TextField:
                clue2TextField.becomeFirstResponder()
            case clue2TextField:
                clue3TextField.becomeFirstResponder()
            default:
                clue3TextField.resignFirstResponder()
            }
            
        }
        return true
    }
}
