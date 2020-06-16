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
    @Binding var centerCoordinate : CLLocationCoordinate2D
    let locations : [CodableMKPointAnnotation]
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showingPlaceDetails : Bool
    var body: some View {
        MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
            .edgesIgnoringSafeArea(.all)
    }
}
