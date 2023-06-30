//
//  ImageCardView.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 22/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI

struct ImageCardView: View {
    @Binding var url: URL
    var body: some View{
        renderImage(url: url)
    }
}

extension ImageCardView {
    @ViewBuilder private var renderPlaceholder: some View {
        MLImage.SUIImagePlaceholder
            .resizable()
            .renderingMode(.template)
            .foregroundColor(Color(uiColor: .softGrey))
            .scaledToFit()
            .padding(60)
    }
    
    @ViewBuilder private func renderImage(url: URL) -> some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            renderPlaceholder
        }
    }
}

struct ImageCardView_Previews: PreviewProvider {
    static var previews: some View {
        let url: Binding<URL> = .constant(URL(string: "https://picsum.photos/200/300")!)
        ZStack {
            Rectangle()
                .fill(Color.darkGrey)
            ImageCardView(url: url)
        }
        .frame(height: 300)
        .previewLayout(.sizeThatFits)
    }
}
