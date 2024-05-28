import SwiftUI

struct ContentView: View {
  
  @ObservedObject var networkingManager = NetworkingManager()
  
  let pageTitle: String = "Earthquakes (Past Hour)"
  
    var body: some View {
      
      NavigationView {
        List(networkingManager.dataList.features, id: \.properties)
      {
        data in
       
        NavigationLink(destination: QuakeDetails(data:data)) {
        CellRow(data: data)
          
          
        
      }
        .navigationBarTitle(Text(pageTitle), displayMode: .inline)
        
      }
}
      .phoneOnlyStackNavigationView()
}
}
  

  
  func timeConverter(timeStamp: Double) -> String {
    
    let unixTimestamp = timeStamp / 1000 // Milliseconds.
    
    let date = Date(timeIntervalSince1970: unixTimestamp)
    
    let dataFormatter = DateFormatter()
    dataFormatter.timeZone = TimeZone(abbreviation: "GMT")
    
    dataFormatter.locale = NSLocale.current
    dataFormatter.dateFormat = "MMM, dd, YYYY, hh:mm:ss a"
    
    return dataFormatter.string(from: date)
  }

// Take care of View when in Landscape Mode:
extension View
{
  func phoneOnlyStackNavigationView() -> some View {
    if UIDevice.current.userInterfaceIdiom == .phone {
      return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
      
    }else {
      
      return AnyView(self)
    }
  }
}
  

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
