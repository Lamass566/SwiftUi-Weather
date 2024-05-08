import SwiftUI

struct Days: Identifiable{
    var id = UUID()
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
}

private var daysArray = [
    Days(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 20),
    Days(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 17),
    Days(dayOfWeek: "THU", imageName: "cloud.sun.fill", temperature: 34),
    Days(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 15),
    Days(dayOfWeek: "SAT", imageName: "wind.snow", temperature: -18)
]

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack{
                CityTextView(cityName: "Kyiv")
                
                MainWeaterStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                     temperature: 20)
                
                
                HStack(spacing: 20){
                    ForEach(daysArray){
                        daysArray in
                        WeatherDayView(dayOfWeek: daysArray.dayOfWeek,
                                       imageName: daysArray.imageName,
                                       temperature: daysArray.temperature)
                    }
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                 backgroundColor: .white,
                                 textColor: .blue)
                }
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
