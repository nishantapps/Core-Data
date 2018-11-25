//
//  DatabaseHelper.swift
//  CoreData Demo 1
//
//  Created by Nishant Rai on 25/11/18.
//  Copyright © 2018 Nishant Rai. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper {
    
    static var sharedInstance = DatabaseHelper()
    
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    func save(object: [String : String]){
        
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as? Student
        student?.name = object["name"]
        student?.address = object["address"]
        student?.mobile = object["mobile"]
        student?.city = object["city"]
        
        do{
            try context?.save()
        }catch{
            print("data is not saved")
        }
        
    }
    
    func getStudentData() -> [Student] {
        let student = [Student]()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        
        do{
            try context?.fetch(fetchRequest) as! [Student]
        }catch{
            print("cannot get data")
        }
        
        return student
     
    }
    
    
    func deleteStudentData(index:Int) -> [Student] {
        var student = getStudentData()
        context?.delete(student[index])
        student.remove(at: index)
        
        do{
            try context?.save()
        }catch{
            print("cannot deleted")
        }
        
        return student
        
    }
    
}
