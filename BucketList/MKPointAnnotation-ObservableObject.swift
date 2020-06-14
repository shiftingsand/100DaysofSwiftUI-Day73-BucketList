//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Chris Wu on 6/14/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import MapKit

extension MKPointAnnotation : ObservableObject {
    public var wrappedTitle : String {
        get {
            self.title ?? "Unknown title"
        }
        
        set {
            self.title = newValue
        }
    }
    
    public var wrappedSubtitle : String {
        get {
            self.subtitle ?? "Unknown subtitle"
        }
        
        set {
            self.subtitle = newValue
        }
    }
}
