//
//  GarmentViewModel.swift
//  LululemonAssignment
//
//  Created by Munro Azumi on 10/17/21.
//

import Foundation

class GarmentViewModel {
    
    var garments = [Garment]()
    let dbManager = DatabaseManager.shared
    
    func fetchGarmentsFromDB(sort: NSSortDescriptor) {
        garments = dbManager.fetchGarments(sort: sort)
    }
    
    func getRowCount() -> Int {
        return garments.count
    }
    
    func getGarmentName(index: Int) -> String {
        return garments[index].name ?? ""
    }
    
    func getGarmentCreationTime(index: Int) -> Date {
        return garments[index].creationTime ?? Date()
    }
    
    func deleteGarmentInDB(index: Int) {
        dbManager.deleteGarment(garment: garments[index])
    }
    
    func saveGarmentToDB(name: String) {
        dbManager.saveGarment(name: name)
    }
}
