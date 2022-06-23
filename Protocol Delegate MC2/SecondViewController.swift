//
//  SecondViewController.swift
//  Protocol Delegate MC2
//
//  Created by Local Administrator on 23/06/22.
//

import UIKit

protocol roomSelectionDelegate{
    func didSelectRoom(roomName: String, image: UIImage)
}

class SecondViewController: UIViewController {
    
    var selectionDelegate: roomSelectionDelegate?

    @IBOutlet weak var roomPicker: UIPickerView!
    @IBOutlet weak var selectedLabel: UILabel!
    
    //picker data dummy
    let roomData = ["Bed Room", "Living Room", "Bath Room"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        roomPicker.dataSource = self
        roomPicker.delegate = self
    }

    @IBAction func lightUpButton(_ sender: Any) {
        //masih force unwrap
        //when the button is pressed, it will pass the data(job) to the 1st viewcontroller
        selectionDelegate?.didSelectRoom(roomName: selectedLabel.text!, image: UIImage(named: "on")!)
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UIPickerView DataSource & Delegate

extension SecondViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return roomData.count
    }
}

extension SecondViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return roomData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedLabel.text = roomData[row]
    }
}
