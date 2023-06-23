//
//  ImageCardView.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 22/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI

struct ImageCardView: View {
    var url: URL
    var body: some View{
        ZStack {
            Rectangle()
                .fill(Color.clear)
                .border(Color.black)
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                MLImage.SUIImagePlaceholder
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(uiColor: .softGrey))
                    .scaledToFit()
                    .padding(60)
            }
        }
        .frame(height: 300)
    }
}

struct ImageCardView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCardView(url: URL(string: "https://picsum.photos/200/300")!)
            .previewLayout(.sizeThatFits)
    }
}
