//
//  ContentView.swift
//  MapCoordinates
//
//  Created by Steven Lipton on 9/20/20.
//
// An exercise file for iOS Development Tips Weekly
// A weekly course on LinkedIn Learning for iOS developers
//  Season 12 (Q4 2020) video 07
//  by Steven Lipton (C)2020, All rights reserved
// Learn more at https://linkedin-learning.pxf.io/YxZgj
//This Week:  Learn how to add maps with annotations to SwiftUI
//  For more code, go to http://bit.ly/AppPieGithub


import SwiftUI
import MapKit

var coord = CLLocationCoordinate2DMake(42.0460, -87.8861)
var region:MKCoordinateRegion{
    return MKCoordinateRegion(center: coord, latitudinalMeters: 200, longitudinalMeters: 200)
}
struct Item:Identifiable{
    var id = UUID()
    let latitude:Double
    let longitude:Double
    var coordinate:CLLocationCoordinate2D{
        CLLocationCoordinate2DMake(latitude, longitude)
    }
}



struct ContentView: View {
    @State var mapRegion = region
    let a = [Item(latitude: coord.latitude, longitude: coord.longitude)]
    var body: some View {
        VStack {
            Text("First Franchise").font(.title)
            Map(coordinateRegion: $mapRegion, annotationItems: a)
                {point in MapAnnotation(coordinate:point.coordinate)
                {Image(systemName:"m.circle")}
                    
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
