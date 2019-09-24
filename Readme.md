# MLMini

Esta es una mini aplicación de Mercadolibre que brinda funcionalidades básicas con respecto a la búsqueda de productos en general, muestra de resultados de una manera legible y presenta una vista de detalles de los productos.

## **Índice**   
1. [UI/UX](#id1)
2. [Serialización del JSON](#id2)
3. [Consulta a la API y el Adapter Mercadolibre](#id3)
4. [Librerias](#id4)
5. [Permisos](#id5)

## UI/UX <a name="id1"></a>

La interfaz grafica proporciona al usuario un feedback muy importante acerca del estado de la aplicación en cada momento y la propia modificación del mismo.

Para esto se diseñaron 3 pantallas:

- Pantalla de búsqueda
- Pantalla de Listado de resultados de búsqueda
- Pantalla de descripción del ítem o producto

### Pantalla de búsqueda

Se trató de realizar una interfaz que resulte simple y amigable, que respete los colores utilizados en la app y que demuestre ser intuitiva para usar.

### Pantalla de Listado de resultados de búsqueda

Al investigar la app existente, se llego a la conclusión de que esta pantalla consta de una tableview.
En la app realizada también esta pantalla consta de una tableview, la cual es rellenada con celdas reusables customs. La celda custom esta diseñada e implementada usando un .xib y su controlador.

### Pantalla de descripción del ítem o producto

En esta pantalla, se encuentra construida a partir de una `tableview`. Donde cada una de las secciones en la descripcion representa una celda custom y que la Header View de la tableview es el carrousel de fotos de productos.
El carrousel de las fotos del producto esta contruido a partir de una `Collection View` con paginado activo, donde el tamaño de cada celda es el de la collection view. 


#### Paleta de colores

Se definió una paleta de colores bastante simple, se encuentra situada dentro de la carpeta `Extensions` con el nombre **UIColorExtension**. Los colores definidos son los colores utilizados en las paginas o lo mas parecido que se pudo. La extensión nos permite tenes nuestros propios colores definidos en un solo lugar y si el día de mañana se cambian, no hay que realizar modificación alguna en la app.

#### Fonts

Encontré esta [pagina](http://ux.mercadolibre.com/brandbook/tipografia.html) que explica la tipografía utilizada en la app oficial. En el proyecto por falta de tiempo no se incluyó, sino que se optó por elegir una font lo mas similar a la que encontramos en la aplicación iOS.



## Serialización del JSON <a name="id2"></a>

A partir del uso del protocolo `Codable` se construyó un modelo que permite el mapeo de una respuesta JSON a una representación interna (modelo).

Una pregunta segura que uno mismo se puede esta haciendo es que dicho protocolo es un poco "overkill" y que solo requerimos de que nuestro modelo conforme el protocolo `Decodable` para la tarea que se quiere realizar, la respuesta es que el uso del protocolo se pensó para que en un futuro se agreguen nuevas funcionalidades, por ejemplo el uso de CoreData o la que se deba hacer un el uso de `Encodable` para generar una respuesta o convertirse a otro tipo de representación.

En el proyecto se encuentran en la carpeta Model dos archivos:

- APIResponseModel

- ItemAPIResponseModel

Ambos modelos son utilizados para la serialización del JSON, en un principio eran modelos demasiado grandes y posteriormente se los redució notablemente. Esto se debe a que con un modelo muy grande se deben tener en cuenta las respuestas especificas en las distintas clases que lo componen y por no poseer mayor cantidad de tiempo.

## Consulta a la API y el Adapter Mercadolibre <a name="id3"></a>

### Service Manager

Dentro de este apartado como primera medida se tiene una clase que permite realizar las consultas a diversas API. No tiene en cuenta a que URL o a que API se realiza la request, solamente debemos poseer un modelo previamente que se conforme con el protocolo `Codable` y pasar una `URL` valida que nos devuelva un JSON acorde al modelo. Todo esto anterior viene al caso para explicar que esta clase es **Genérica**. 

### Adapter

Para el encapsulamiento de la respuesta e implementacion de la respuesta de la API de Mercadolibre, tenemos una clase que podriamos llamarla `Adapter`, ya que nos convierte la interfaz de respuesta en una mas sencilla de utilizar y manejar.
De esta manera no tenemos que preocuparnos que el dia de mañana se cambie la forma del JSON y tener que modificar mas de medio proyecto por ello.

El adapter no permite saber como se recibe la respuesta, solo nos permite obtener cierta info a través de consultas que nosotros podemos realizar. Y mucha de estas respuestas están construidas en un modelo que posee lo esencial, que son utilizados dentro del proyecto.

Las implementaciones antes comentadas deben conformarse a los protocolos creados para dicho fin y nos permite que si en un futuro cambie la URL, el formato del JSON, etc, solo se vea afectada la clase adapter.

## Librerias <a name="id4"></a>
Dentro de las librerias utilizadas tenemos:

- SDWebImages

### SDWebImages
Permite la carga asincrónica por demanda de las imágenes de los productos de la tabla de los resultados de productos se utilizó SDWebImages.
Dentro de los motivos por la cual se eligió se debe a la simplicidad para cargar imágenes por URL. No mucho menos esta librería nos facilita tener un caché de las imágenes, esto viene bien por 2 razones:
- No volver a descargar una imagen ya descargada, ahorrándonos una importante cantidad de datos de la red. 
- Al reducir el consumo de datos, disminuimos la cantidad de energía que requerimos por comunicación y procesamiento.

La integración al proyecto de la librería fue realizada mediante Carthage.

Link al repo de [SDWebImages](https://github.com/SDWebImage/SDWebImage).

## Permisos <a name="id5"></a>
Para poder realizar la descarga de las imágenes, se debió solicitar el acceso agregar una propiedad en el archivo `info.plist`. 
La propiedad que tenemos que agregar es  `Allow arbitrary loads` en `YES`.
