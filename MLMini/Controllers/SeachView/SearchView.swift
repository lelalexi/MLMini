//
//  SearchView.swift
//  MLMini
//

import SwiftUI

struct SearchView: View {
    var viewModel: SearchViewViewModel
    @EnvironmentObject var parent: SearchViewControllerSwiftUIBridge
    @State var textFieldText: String = ""
    var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            Spacer()
            SearchViewTopImage()
            Spacer()
            Spacer()
            Group {
                MLMiniTextField(text: $textFieldText, placeholder: "Search on Mercadolibre")
                    .padding(.bottom, 8)
                PrimaryButton(label: "Buscar") {
                    viewModel.onSearchButtonTap(textToSearch: textFieldText)
                }
            }
            Spacer()
        }
        .padding(.horizontal, 20.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("activeYellow"))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewBuilder().getView(forController: UIViewController())
    }
}

private struct SearchViewTopImage: View {
    var body: some View {
        Image("MLWallpaper")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 100)
    }
}
