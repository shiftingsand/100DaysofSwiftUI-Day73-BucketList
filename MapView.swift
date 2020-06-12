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
    class Coordinator : NSObject, MKMapViewDelegate {
        var parent : MapView
        
        init(_ parent : MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        
        func mapView(_ mapview : MKMapView, viewFor annotation : MKAnnotation) -> MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let annotation = MKPointAnnotation()
        annotation.title = "Tokyo DisneySea"
        annotation.coordinate = CLLocationCoordinate2DMake(35.6267, 139.8851)
        mapView.addAnnotation(annotation)
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
    }
}
