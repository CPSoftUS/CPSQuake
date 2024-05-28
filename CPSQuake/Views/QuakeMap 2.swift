import MapKit
import SwiftUI
import UIKit

struct MapView: UIViewRepresentable
{
  var data: Features
  
  func makeUIView(context: Context) -> MKMapView {
    
    MKMapView(frame: .zero)
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
    
    let annotation = MKPointAnnotation()
    
    let coordinates = CLLocationCoordinate2D(latitude: data.geometry.coordinates[1], longitude: data.geometry.coordinates[0])
    
    let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
    
    let region = MKCoordinateRegion(center: coordinates, span: span)
    
    uiView.setRegion(region, animated: true)
    
    annotation.coordinate = coordinates
    annotation.title = "Place: \(data.properties.place)"
    annotation.subtitle = "Type: \(data.properties.type)"
    
    uiView.addAnnotation(annotation)
  }
}
