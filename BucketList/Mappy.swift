//
//  Mappy.swift
//  BucketList
//
//  Created by Chris Wu on 6/16/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

struct Mappy : View {
//    @Binding var centerCoordinate : CLLocationCoordinate2D
//    @Binding var locations : [CodableMKPointAnnotation]
//    @Binding var selectedPlace: MKPointAnnotation?
//    @Binding var showingPlaceDetails : Bool
    let myFilename = "SavedPlaces"
    @State var centerCoordinate = CLLocationCoordinate2D()
    @State var locations = [CodableMKPointAnnotation]()
    @State var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    @State private var showingEditScreen = false
    var body: some View {
        ZStack {
            MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        let newLocation = CodableMKPointAnnotation()
                        newLocation.title = "Example Location"
                        newLocation.coordinate = self.centerCoordinate
                        self.locations.append(newLocation)
                        self.selectedPlace = newLocation
                        self.showingEditScreen = true
                    }
                    ) {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.black.opacity(0.75))
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Circle())
                            .padding(.trailing)
                    }
                }
            }
        }  // zstack
        .onAppear(perform: loadData)
        .alert(isPresented: $showingPlaceDetails){
            Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place information."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
                self.showingEditScreen = true
            })
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: saveData) {
            if self.selectedPlace != nil {
                EditView(placemark: self.selectedPlace!)
            }
        }
    }  // body
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadData() {
        let filename = getDocumentsDirectory().appendingPathComponent(myFilename)
        
        do {
            let data = try Data(contentsOf: filename)
            locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
        } catch {
            print("Unable to load saved data!")
        }
    }
    
    func saveData() {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent(myFilename)
            let data = try JSONEncoder().encode(self.locations)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
            print("done savingn data")
        } catch {
            print("Unable to save data!")
        }
    }
}
