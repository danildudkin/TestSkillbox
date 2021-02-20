import Foundation
import UIKit
import CoreData

var tableDeals: [String] = []
var tableTime: [Int] = []
var tableDone: [Bool] = []


class taskC: NSObject {
    
    static let shared = taskC()
    
    func addItem(_ model: String,_ time: Int,_ done: Bool,_ n: Int) {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let viewContext = appdelegate.persistentContainer.viewContext
        if let entEntity = NSEntityDescription.entity(forEntityName: "Entity", in: viewContext){
            if n == 1 {
            let entit = NSManagedObject(entity: entEntity, insertInto: viewContext)
            entit.setValue(model, forKey: "model")
                tableDeals.append(model)
            entit.setValue(time, forKey: "time")
                tableTime.append(time)
            entit.setValue(done, forKey: "done")
            tableDone.append(done)
                try? viewContext.save()
            }
            }
        if n == 0 {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Entity")
            let request = try! viewContext.fetch(fetchRequest)
            for (_, data) in request.enumerated() {
                if let value = data.value(forKey: "done") as? Bool {
                    tableDone.append(value)
                }
                if let value = data.value(forKey: "time") as? Int {
                    tableTime.append(value)
                }
                if let value = data.value(forKey: "model") as? String {
                    tableDeals.append(value)
                }
            }
        }

    }
    
    func addDeal(_ model: String) {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let viewContext = appdelegate.persistentContainer.viewContext
        if let entEntity = NSEntityDescription.entity(forEntityName: "Entity", in: viewContext){
            let entit = NSManagedObject(entity: entEntity, insertInto: viewContext)
            entit.setValue(model, forKey: "model")
            try? viewContext.save()
            }
        }
    func addTime(_ time: Int) {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let viewContext = appdelegate.persistentContainer.viewContext
        if let entEntity = NSEntityDescription.entity(forEntityName: "Entity", in: viewContext){
            let entit = NSManagedObject(entity: entEntity, insertInto: viewContext)
            entit.setValue(time, forKey: "time")
            try? viewContext.save()
            }
        }
    func addDone(_ done: Bool) {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let viewContext = appdelegate.persistentContainer.viewContext
        if let entEntity = NSEntityDescription.entity(forEntityName: "Entity", in: viewContext){
            let entit = NSManagedObject(entity: entEntity, insertInto: viewContext)
            entit.setValue(done, forKey: "done")
            try? viewContext.save()
            }
        }
    
    func removeItem (_ index: Int){
        
        tableTime.remove(at: index)
        tableDeals.remove(at: index)
        tableDone.remove(at: index)
        
        delete()
       
        for (_, data) in tableDeals.enumerated() {
            addDeal(data)
        }
        for (_, data) in tableTime.enumerated() {
            addTime(data)
        }
        for (_, data) in tableDone.enumerated() {
            addDone(data)
        }
    }
    
    func changeState(_ item: Int) {
        delete()
        tableDone[item] = !(tableDone[item])
        for (_, data) in tableDeals.enumerated() {
            addDeal(data)
        }
        for (_, data) in tableTime.enumerated() {
            addTime(data)
        }
        for (_, data) in tableDone.enumerated() {
            addDone(data)
        }
    }
    func delete() {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let viewContex = appdelegate.persistentContainer.viewContext
        let fetchRequestEntity = NSFetchRequest<NSManagedObject>(entityName: "Entity")
        let request = try! viewContex.fetch(fetchRequestEntity)
        for entit in request {
            viewContex.delete(entit)
        }
        try? viewContex.save()
    }
}
