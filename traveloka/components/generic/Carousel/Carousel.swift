//
//  Carousel.swift
//  traveloka
//
//  Created by macbook pro on 27/12/2023.
//

import SwiftUI
import Combine

struct CarouselItem {
    var id: Int
    var imgUrl: String
    var linkTo: String
    
    init(id: Int, imgUrl: String, linkTo: String) {
        self.id = id
        self.linkTo = linkTo
        self.imgUrl = imgUrl
    }
}

struct Carousel: View {
    var maxCarouselWidth = UIScreen.main.bounds.width
    @State var activeCarousels: [Int: Bool] = [:]
    @State var prevCarouselIndx: Int = 0
    @State var intCarouselIndex : Int = 0
    @State var timedCarouselIndex : Int = 0
    let carouselItems: [CarouselItem]
    
    //Pub-sub system
    let detector: CurrentValueSubject<CGFloat, Never> // Consumer
    let publisher: AnyPublisher<CGFloat, Never> // publisher 1
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect() // publisher 2
    
    
    init(carouselItems: [CarouselItem]) {
        self.carouselItems = carouselItems
        let detector = CurrentValueSubject<CGFloat, Never>(0)
        self.publisher = detector
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .dropFirst()
            .eraseToAnyPublisher()
        self.detector = detector
    }
    var body: some View {
        ScrollViewReader { scrollReader in
            ScrollView(.horizontal) {
                GeometryReader { geo in
                    Rectangle().fill(Color.blue).frame(width: 0.0, height: 0.0).onChange(of: geo.frame(in: .global).midX, perform: { value in
                        let floatCarouselIndex: Float = Float((value - (maxCarouselWidth + maxCarouselWidth/2)) / maxCarouselWidth)
                        intCarouselIndex = Int(abs(floorf(floatCarouselIndex)))
                        timedCarouselIndex = intCarouselIndex
                        if prevCarouselIndx != intCarouselIndex {
                            for carousel in carouselItems {
                                if carousel.id  == intCarouselIndex {
                                    activeCarousels[carousel.id] = true
                                    withAnimation(.linear(duration: 10)) {
                                        scrollReader.scrollTo(intCarouselIndex)
                                    }
                                } else {
                                    activeCarousels[carousel.id] = false
                                    
                                }
                            }
                            prevCarouselIndx = intCarouselIndex
                        }
                        detector.send(value)
                    }).onAppear(perform: {
                        for carousel in carouselItems {
                            if carousel.id  == 0 {
                                activeCarousels[carousel.id] = true
                            } else {
                                activeCarousels[carousel.id] = false
                            }
                        }
                    })
                    .onReceive(publisher, perform: { _ in
                        withAnimation(.linear(duration: 3)) {
                            scrollReader.scrollTo(intCarouselIndex)
                        }
                    }).onReceive(timer, perform: { _ in
                        if timedCarouselIndex <= carouselItems.count  {
                            timedCarouselIndex = timedCarouselIndex + 1
                            scrollReader.scrollTo(timedCarouselIndex)
                        } else {
                            
                            scrollReader.scrollTo(0)
                            timedCarouselIndex = 0
                        }
                    })
                }.frame(width: 0.0, height: 0.0)
                HStack {
                    ForEach(carouselItems, id: \.self.id) { item in
                        Image(item.imgUrl).resizable().frame(width: UIScreen.main.bounds.width, height: 180)
                    }
                }
            }.overlay (
                HStack {
                    ForEach(carouselItems, id: \.self.id) { item in
                        if activeCarousels[item.id] == true {
                            Circle().fill(Color.black).frame(width: 8.0, height:8.0)
                        } else {
                            Circle().fill(Color.white).frame(width: 8.0, height:8.0)
                        }
                        
                    }
                }.padding([.top], 160.0)
            )
        }
    }
}

struct Carousel_Previews: PreviewProvider {
    static let carouselItems = [CarouselItem(id: 0, imgUrl:"promotionBanner1",linkTo: "")]
    static var previews: some View {
        Carousel(carouselItems: carouselItems)
    }
}
