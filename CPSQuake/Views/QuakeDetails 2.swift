import SwiftUI
import Foundation
import UIKit
import MapKit

struct QuakeDetails: View {
  
  var data: Features
  
    var body: some View {
      ZStack(alignment: .top) {
        
        MapView(data: data)
          .edgesIgnoringSafeArea(.all)

        VStack(alignment: .center, spacing: 6) {
        Text(String(data.properties.mag))
        .font(.largeTitle)
          
        Text(data.properties.place)
        .font(.caption)
          
        
        
        }.clipShape(Rectangle())
          .frame(width: nil, height: nil)
          .padding(.all, 20)
          .background(Color.green)
        .shadow(radius: 9)
        .cornerRadius(9)
          .opacity(0.8)
      }
}
}
