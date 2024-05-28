import Foundation

class NetworkingManager: ObservableObject
{
  
  var url="https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson"
  
  @Published var dataList = QuakeAPIList(features: [])
  
  init()
  {
    guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url)
        {
          (data, _,_) in
          guard let data = data else {return}
          
          let dataList = try! JSONDecoder().decode(QuakeAPIList.self, from: data)
          
          DispatchQueue.main.async
          {
            self.dataList = dataList
            
            print(dataList.features)
          }
        }.resume()
      }
  
        func timeConverter(timeStamp: Double) -> String
        {
          let unixTimestamp = timeStamp / 1000 // Milliseconds.
          
          let date = Date(timeIntervalSince1970: unixTimestamp)
          
          let dataFormatter = DateFormatter()
          dataFormatter.timeZone = TimeZone(abbreviation: "GMT")
          
          dataFormatter.locale = NSLocale.current
          dataFormatter.dateFormat = "dd MMM YY, hh:mm:ss a"
          
          return dataFormatter.string(from: date)
        }
    }
  
