//
//  ProductDetailCarouselView.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 21/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI

struct ProductDetailCarouselView: View {
    var images: [URL]
    @State private var index = 0
    var body: some View {
        VStack{
            TabView(selection: $index) {
                ForEach(images.indices, id: \.self) { index in
                    ImageCardView(url: images[index])
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        }
        .frame(height: 300)
    }
}

struct ProductDetailCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        let imageArray = [ URL(string: "https://picsum.photos/200/300")!,
                           URL(string: "https://picsum.photos/200/300")!,
                           URL(string: "https://picsum.photos/200/300")!,
                           URL(string: "https://picsum.photos/200/300")!]
        ProductDetailCarouselView(images: imageArray)
            .previewLayout(.sizeThatFits)
    }
}
