//
//  ContentView.swift
//  QuoteJJ
//
//  Created by José Javier Cueto Mejía on 15/12/19.
//  Copyright © 2019 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

struct ContentView: View {
     let quotes: [Quote]
    var body: some View {
        VStack {
            CircleImage(imageName: "lilly")
                .frame(width: 160,height: 160)
                .padding(.top, 89)
                .padding(.bottom, 20)
            MainView(quotes: self.quotes)
            Spacer()
        }.background(Image("motivation_bg").resizable().scaledToFill().edgesIgnoringSafeArea(.all))
            
    }
}

struct MainView:View {
    var quotes: [Quote]

    var body: some View{
        VStack{
            HStack{
                Text("\(quotes.count) Quotes Availables!")
                    .font(.subheadline)
                    .italic()
                    .foregroundColor(.white)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(self.quotes, id: \.name) { quote in
                        VStack {
                            CircleImage(imageName: "lilly")
                            Text("''\(quote.quote)''")
                                .font(.headline)
                            Divider()
                            Text(quote.name)
                                .italic()
                                .font(.custom("Helvetica neue", size: 14))
                        }.frame(width: 300, height: 300)
                            .foregroundColor(.gray)
                            .padding(.all, 4)
                            .background(Color.white)
                        .cornerRadius(13)
                        .overlay(Rectangle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.clear,.pink]), startPoint: .center, endPoint: .topLeading)
                            )
                            .clipped()
                            .shadow(radius: 8)
                        )
                        
                    }
                }
            }
        }
    }
}


//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(quotes: quoteData)
//    }
//}
//

struct CircleImage: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .shadow(radius: 10)
            .frame(width: 100, height: 100)
    }
}
