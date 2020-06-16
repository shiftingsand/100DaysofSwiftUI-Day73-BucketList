//
//  ContentView.swift
//  BucketList
//
//  Created by Chris Wu on 6/11/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import SwiftUI
import LocalAuthentication
import MapKit

struct ContentView: View {
    @State private var isUnlocked = true
    
    var body: some View {
        ZStack {
            if isUnlocked {
                Mappy()
            } else {
                Button("Unlock places") {
                    self.authenticate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        } // zstack
    }
    
    func authenticate() {
        let context = LAContext()
        var error : NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock your places."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        // error
                    }
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
