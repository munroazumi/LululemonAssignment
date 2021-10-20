//
//  AddGarmentViewController.swift
//  LululemonAssignment
//
//  Created by Munro Azumi on 10/17/21.
//

import UIKit

class AddGarmentViewController: UIViewController {

    @IBOutlet weak var garmentTextField: UITextField!
    let garmentVM = GarmentViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpNavBar()
        garmentTextField.becomeFirstResponder()
    }
    
    func setUpNavBar() {
        self.title = "Add"
        let saveBtn = UIBarButtonItem.init(title: "Save", style: .done, target: self, action: #selector(saveBtnPressed))
        navigationItem.rightBarButtonItem = saveBtn
    }
    
    @objc func saveBtnPressed() {
        if let garmentName = garmentTextField.text {
            garmentVM.saveGarmentToDB(name: garmentName)
        }
        navigationController?.popViewController(animated: true)
    }
    
}
