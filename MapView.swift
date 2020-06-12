//
//  MapView.swift
//  BucketList
//
//  Created by Chris Wu on 6/12/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView : UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
    }
}
