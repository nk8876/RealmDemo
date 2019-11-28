//
//  Pet.swift
//  RealmDemo
//
//  Created by Dheeraj Arora on 22/11/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import Foundation
import RealmSwift

class Pet: Object {
    @objc dynamic var name = ""
    @objc dynamic var user : User?
}
