//
//  ProductDetailCarouselView.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 21/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI

struct ProductDetailCarouselView: View {
    var images: [URL]?
    @State private var index = 0
    var body: some View {
        if let images = images {
            renderTabView(withIndex: $index,
                          images: images)
        } else {
            EmptyView()
        }
    }
}

extension ProductDetailCarouselView {
    @ViewBuilder private func renderTabView(withIndex index: Binding<Int>, images: [URL]) -> some View {
        TabView(selection: $index) {
            ForEach(images.indices, id: \.self) { index in
                // TODO: Refactor to make the carousel generic to Any Card
                ImageCardView(url: .constant(images[index]))
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}

struct ProductDetailCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        let imageArray = [ URL(string: "https://picsum.photos/200/300")!,
                           URL(string: "https://picsum.photos/200/300")!,
                           URL(string: "https://picsum.photos/200/300")!,
                           URL(string: "https://picsum.photos/200/300")!]
        Group {
            ProductDetailCarouselView(images: imageArray)
            ProductDetailCarouselView(images: nil)
        }
        .frame(height: 300)
        .previewLayout(.sizeThatFits)
    }
}
