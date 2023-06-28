//
//  ProductDetailDescriptionSection.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 28/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI

struct ProductDetailDescriptionSection: View {
    var descriptionBody: String = "Con tu consola Xbox Series tendrás entretenimiento asegurado todos los días. Su tecnología fue creada para poner nuevos retos tanto a jugadores principiantes como expertos. La nueva generación de consolas está comandada por la Xbox Series que llegó al mercado para sorprender a todos. Su potencia y alto rendimiento te permitirá reducir las horas de descarga de juegos y contenido de manera considerable en comparación con otras consolas. Además, vas a poder jugar durante horas mientras te divertís con jugadores de todo el mundo. Adaptada a tus necesidades Guardá tus apps, fotos, videos y mucho más en el disco duro, que cuenta con una capacidad de 1 TB. Al contar con un procesador de 8 núcleos y uno gráfico, brinda una experiencia dinámica, respuestas ágiles, y transiciones fluidas de imágenes en alta definición. Por otro lado, tiene puerto USB y salida HDMI, que permiten conectar accesorios y cargar la batería de tu control mientras jugás. Vas a poder reproducir música, ver tus películas y series favoritas a través de las aplicaciones descargables."
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Divider()
            Text("Descripcion")
                .font(.custom("Avenir-Book", size: 22))
                .foregroundColor(Color.primaryText)
            Text(descriptionBody)
                .font(.custom("Avenir-Book", size: 18))
                .foregroundColor(Color.primaryText)
        }.padding()
    }
}

struct ProductDetailDescriptionSection_Previews: PreviewProvider {
    static var previews: some View {
        let description = "Con tu consola Xbox Series tendrás entretenimiento asegurado todos los días. Su tecnología fue creada para poner nuevos retos tanto a jugadores principiantes como expertos. La nueva generación de consolas está comandada por la Xbox Series que llegó al mercado para sorprender a todos. Su potencia y alto rendimiento te permitirá reducir las horas de descarga de juegos y contenido de manera considerable en comparación con otras consolas. Además, vas a poder jugar durante horas mientras te divertís con jugadores de todo el mundo. Adaptada a tus necesidades Guardá tus apps, fotos, videos y mucho más en el disco duro, que cuenta con una capacidad de 1 TB. Al contar con un procesador de 8 núcleos y uno gráfico, brinda una experiencia dinámica, respuestas ágiles, y transiciones fluidas de imágenes en alta definición. Por otro lado, tiene puerto USB y salida HDMI, que permiten conectar accesorios y cargar la batería de tu control mientras jugás. Vas a poder reproducir música, ver tus películas y series favoritas a través de las aplicaciones descargables."
        ProductDetailDescriptionSection(descriptionBody: description)
    }
}
