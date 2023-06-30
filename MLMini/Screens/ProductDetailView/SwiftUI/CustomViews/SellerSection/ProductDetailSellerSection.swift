//
//  ProductDetailSellerSection.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 28/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI

struct ProductDetailSellerSection: View {
    @Binding var sellerReputation: MLSellerReputationDomainModel
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                    Divider()
                    Text("Informacion sobre el vendedor")
                        .font(.custom("Avenir-Book", size: 20))
                        .foregroundColor(Color.primaryText)
                        .padding(.bottom, 8)
                SellerQualityMeter(widthSize: geometry.size.width, sellerReputation: $sellerReputation)
            }
        }
        .padding(.horizontal)
    }
}

struct ProductDetailSellerSection_Previews: PreviewProvider {
    var sellerLevel: MLSellerReputationDomainModel = MLSellerReputationDomainModel(levelId: .Level3)
    static var previews: some View {
        // ProductDetailSellerSection(sellerReputation: sellerLevel)
        Rectangle()
    }
}

struct SellerQualityMeter: View {
    private var rectagleWidth: CGFloat { calculateRectangleWidth(totalAvailableWidth: widthSize) }
    var rectangleColors: [Color] = Constants.RECTANGLE_COLORS
    
    var widthSize: CGFloat
    @Binding var sellerReputation: MLSellerReputationDomainModel
    
    var body: some View {
            HStack(alignment: .center) {
                ForEach(0..<Constants.RECTANGLE_QUANTITY, id: \.self) { index in
                    Rectangle()
                        .frame(width: rectagleWidth,
                               height: index == sellerReputation.levelId.mLSellerLevel ?
                               Constants.HIGHLIGHTED_RECTANGLE_HEIGHT :
                                Constants.NORMAL_RECTANGLE_HEIGHT)
                        .foregroundColor(Constants.RECTANGLE_COLORS[index])
                        .opacity(index == sellerReputation.levelId.mLSellerLevel ?
                                 Constants.RECTANGLE_OPACITY_VALUE_WHEN_HIGHLIGHTED :
                                    Constants.RECTANGLE_OPACITY_VALUE_WHEN_NON_HIGHLIGHTED)
                }
            }
    }
}

extension SellerQualityMeter {
    struct Constants {
        static let RECTANGLE_QUANTITY: Int = 5
        static let NORMAL_RECTANGLE_HEIGHT: CGFloat = 10
        static let HIGHLIGHTED_RECTANGLE_HEIGHT: CGFloat = 15
        static let RECTANGLE_OPACITY_VALUE_WHEN_HIGHLIGHTED: CGFloat = 1
        static let RECTANGLE_OPACITY_VALUE_WHEN_NON_HIGHLIGHTED: CGFloat = 0.15
        static let RECTANGLE_COLORS: [Color] = [ .red, .orange, .activeYellow,  .green, .activeGreen ]
    }
    private func calculateRectangleWidth(totalAvailableWidth width: CGFloat) -> CGFloat{
        let spacing: CGFloat = 8
        return (width - spacing * 4) / 5
    }
}
