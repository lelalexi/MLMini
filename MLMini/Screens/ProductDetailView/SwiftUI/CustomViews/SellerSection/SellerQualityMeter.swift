//
//  SellerQualityMeter.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 30/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI

struct SellerQualityMeter: View {
    private var rectagleWidth: CGFloat { calculateRectangleWidth(totalAvailableWidth: widthSize) }
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
    private struct Constants {
        static let RECTANGLE_QUANTITY: Int = 5
        static let NORMAL_RECTANGLE_HEIGHT: CGFloat = 10
        static let HIGHLIGHTED_RECTANGLE_HEIGHT: CGFloat = 15
        static let RECTANGLE_OPACITY_VALUE_WHEN_HIGHLIGHTED: CGFloat = 1
        static let RECTANGLE_OPACITY_VALUE_WHEN_NON_HIGHLIGHTED: CGFloat = 0.15
        static let RECTANGLE_COLORS: [Color] = [ .red, .orange, .activeYellow,  .green, .activeGreen ]
    }
    private func calculateRectangleWidth(totalAvailableWidth width: CGFloat) -> CGFloat {
        let spacingBetweenRectangles: CGFloat = 8
        return (width - spacingBetweenRectangles * CGFloat(Constants.RECTANGLE_QUANTITY - 1)) / CGFloat(Constants.RECTANGLE_QUANTITY)
    }
}

struct SellerQualityMeter_Previews: PreviewProvider {
    static var previews: some View {
        SellerQualityMeter(widthSize: 300, sellerReputation: .constant(MLSellerReputationDomainModel(levelId: .Level4)))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
