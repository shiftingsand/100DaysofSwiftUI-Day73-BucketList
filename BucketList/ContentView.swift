//
//  ContentView.swift
//  BucketList
//
//  Created by Chris Wu on 6/11/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import SwiftUI

struct User : Identifiable, Comparable {
    let id = UUID()
    var firstName : String
    var lastName : String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    let allUsers : [User] = [
    User(firstName: "Chris", lastName: "Smith"),
        User(firstName: "Andy", lastName: "Andrews"),
        User(firstName: "Brian", lastName: "Zends")
    ].sorted()
    
    var body: some View {
        List {
            ForEach(allUsers) { usey in
                Text("\(usey.lastName) \(usey.firstName)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
