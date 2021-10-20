//
//  CustomTableViewController.swift
//  LululemonAssignment
//
//  Created by Munro Azumi on 10/13/21.
//

import UIKit

class CustomTableView: NSObject {
        
    var garmentVM = GarmentViewModel()
    
    func setupViewModel(vm: GarmentViewModel) {
        self.garmentVM = vm
    }
}

extension CustomTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garmentVM.getRowCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")

        let garmentName = garmentVM.getGarmentName(index: indexPath.row)
        cell?.textLabel?.text = garmentName
        
        return cell ?? UITableViewCell()
    }
}
