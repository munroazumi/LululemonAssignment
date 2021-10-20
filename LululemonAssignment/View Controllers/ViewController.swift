//
//  ViewController.swift
//  LululemonAssignment
//
//  Created by Munro Azumi on 10/13/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var sortSegment: UISegmentedControl!
    let garmentVM = GarmentViewModel()
    let customTable = CustomTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpTable()
        setUpNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTableWithData()
    }
    
    @IBAction func changeSortOrder(_ sender: UISegmentedControl) {
        loadTableWithData()
    }
    
    @objc func addBtnPressed() {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        if let addGarmentVC = st.instantiateViewController(withIdentifier: "AddGarmentViewController") as? AddGarmentViewController {
            navigationController?.pushViewController(addGarmentVC, animated: true)
        }
    }
    
    func setUpTable() {
        tblView.delegate = self
        self.tblView.dataSource = customTable
        self.customTable.setupViewModel(vm: self.garmentVM)
    }
    
    func setUpNavBar() {
        self.title = "List"
        let addBtn = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addBtnPressed))
        navigationItem.rightBarButtonItem = addBtn
    }
    
    func loadTableWithData() {
        var sort = NSSortDescriptor(key: "name", ascending: true)
        switch sortSegment.selectedSegmentIndex {
        case 0:
            sort = NSSortDescriptor(key: "name", ascending: true)
        case 1:
            sort = NSSortDescriptor(key: "creationTime", ascending: true)
        default:
            break
        }
        garmentVM.fetchGarmentsFromDB(sort: sort)
        
        DispatchQueue.main.async {
            self.tblView.reloadData()
        }
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHandler in
            self.garmentVM.deleteGarmentInDB(index: indexPath.row)
            self.loadTableWithData()
        }
        return UISwipeActionsConfiguration(actions: [swipeAction])
    }
}
