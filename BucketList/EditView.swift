//
//  EditView.swift
//  BucketList
//
//  Created by Chris Wu on 6/14/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import SwiftUI
import MapKit

struct EditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var placemark : MKPointAnnotation
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place Name", text: $placemark.wrappedTitle)
                     TextField("Place Description", text: $placemark.wrappedSubtitle)
                }
            }
            .navigationBarTitle("Edit Place")
            .navigationBarItems(trailing: Button("Done") {
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(placemark: MKPointAnnotation.example)
    }
}
