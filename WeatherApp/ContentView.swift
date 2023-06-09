//
//  ContentView.swift
//  WeatherApp
//
//  Created by Jack Morley on 26/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : Color("lightBlue"))
            VStack {
                CityTextView(cityName: "London, UK")
                
                MainWeatherStatus(Temp: isNight ? "6°" : "19°", imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                
                HStack(spacing: 20) {
                    WeatherDayView(day: "MON", imageName: "cloud.sun.fill", temp: 65)
                    WeatherDayView(day: "TUE", imageName: "sun.max.fill", temp: 78)
                    WeatherDayView(day: "WED", imageName: "wind", temp: 74)
                    WeatherDayView(day: "THU", imageName: "thermometer.high", temp: 79)
                    WeatherDayView(day: "FRI", imageName: "cloud.fill", temp: 64)
                }
               Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var day: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(day)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),              startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatus: View {
    
    var Temp: String
    var imageName: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: (imageName))
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(Temp)")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 50)
    }
}


