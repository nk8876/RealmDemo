//
//  ViewController.swift
//  RealmDemo
//
//  Created by Dheeraj Arora on 22/11/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    
   let realMInstance = try! Realm()
    @IBOutlet weak var txtDtata: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func makeUserWithNmae(_ name: String, _ pet: Pet?) -> User {
        let newUser = User()
        newUser.name = name
        newUser.pet = pet
        return newUser
    }
    
    func makePetWithNmae(_ name: String, _ owner: User?) -> Pet {
        let newPet = Pet()
        newPet.name = name
        newPet.user = owner
        return newPet
    }
    @IBAction func saveAction(_ sender: Any) {
        let newPet = self.makePetWithNmae("Spot", nil)
        let newUser = self.makeUserWithNmae("John", newPet)
        let newPet1 = self.makePetWithNmae("Puppy", nil)
        let newUser1 = self.makeUserWithNmae("Naresh", newPet)
        let newPet2 = self.makePetWithNmae("Dubby", nil)
        let newUser2 = self.makeUserWithNmae("Nitish", newPet)
        
        try! realMInstance.write {
            realMInstance.add(newPet)
            realMInstance.add(newUser)
            realMInstance.add(newPet1)
            realMInstance.add(newUser1)
            realMInstance.add(newPet2)
            realMInstance.add(newUser2)
        }
    }
    @IBAction func updateAction(_ sender: Any) {
        if let user = realMInstance.objects(User.self).filter("name = %@", txtDtata.text ?? "No Name" ).first {
            try! realMInstance.write {
                user.name = "James"
                if let pet = user.pet{
                    pet.name = "Jack"
                }
            }
            print(realMInstance.objects(User.self).first ?? "")
        }else{
            print("User Not Found")

        }
    }
    @IBAction func deleteAction(_ sender: Any) {
        if let user = realMInstance.objects(User.self).filter("name = %@", txtDtata.text ?? "No Name" ).first {
            realMInstance.delete(user)
            print("User is successfully deleted")
        }else{
             print("User Not Found")
        }
    }
    @IBAction func findAction(_ sender: Any) {
        if let user1 = realMInstance.objects(User.self).filter("name = %@", txtDtata.text ?? "No Name" ).first {
            print(user1)
        }
    }
    @IBAction func fetchAllAction(_ sender: Any) {
        let users = realMInstance.objects(User.self)
        for user in users {
            print(user)
        }
    }
    
}

