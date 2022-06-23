//
//  ViewController.swift
//  Protocol Delegate MC2
//
//  Created by Local Administrator on 23/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var lampImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func chooseButton(_ sender: Any) {
        let roomSelectionVC = storyboard?.instantiateViewController(withIdentifier: "roomSelection") as! SecondViewController
        
        //hey selection delegate, you have variable "selection delegate", and I want to do that delegate
        roomSelectionVC.selectionDelegate = self
        present(roomSelectionVC, animated: true, completion: nil)
    }
}

//conform or comply to the protocol
extension ViewController: roomSelectionDelegate {
    func didSelectRoom(roomName: String, image: UIImage) {
        roomLabel.text = roomName
        lampImage.image = image
    }
}

