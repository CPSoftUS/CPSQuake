import SwiftUI
import Foundation
import UIKit
import MapKit

struct QuakeDetails: View {
  
  var data: Features
  
  @State private var showShareSheet = false
  
    var body: some View {
      ZStack(alignment: .top) {
        
        MapView(data: data)
          .edgesIgnoringSafeArea(.bottom)

        VStack(alignment: .center, spacing: 6) {
        Text(String(data.properties.mag))
          .font(.custom("SF Pro Text", size: 30))
          .foregroundColor(Color.white)
        
       }.clipShape(Rectangle())
          .padding(.all, 20)
          .frame(width: nil, height: nil)
          
          .background(Color.black)
        .shadow(radius: 9)
          .border(Color.white)
          .animation(.interactiveSpring())
        
      
        
      }.navigationBarTitle(Text("\(data.properties.place)"), displayMode: .inline)
}
  
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
    annotation.subtitle = "Magnitude: \(data.properties.mag)"
    
    uiView.addAnnotation(annotation)
  }
}
  
  struct ShareSheet: UIViewControllerRepresentable {
      typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
      
      let activityItems: [Any]
      let applicationActivities: [UIActivity]? = nil
      let excludedActivityTypes: [UIActivity.ActivityType]? = nil
      let callback: Callback? = nil
      
      func makeUIViewController(context: Context) -> UIActivityViewController {
          let controller = UIActivityViewController(
              activityItems: activityItems,
              applicationActivities: applicationActivities)
          controller.excludedActivityTypes = excludedActivityTypes
          controller.completionWithItemsHandler = callback
          return controller
      }
      
      func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
          // nothing to do here
      }
  }
}
