# MLMini

Foobar is a Python library for dealing with word pluralization.

## Installation

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install foobar.

```bash
pip install foobar
```

## Usage

```python
import foobar

foobar.pluralize('word') # returns 'words'
foobar.pluralize('goose') # returns 'geese'
foobar.singularize('phenomena') # returns 'phenomenon'
```

## Librerias
Dentro de las librerias utilizadas tenemos:

- SDWebImages

### SDWebImages
Para la carga asincrónica por demanda de las imágenes de los productos de la tabla de los resultados de productos se utilizó SDWebImages.
Dentro de los motivos por la cual se eligió se debe a la simplicidad para cargar imagenes por URL. No mucho menos esta libreria nos facilita tener un caché de las imagenes, esto viene bien por 2 razones:
- No volver a descargar una imagen ya descargada, ahorrándonos una importante cantidad de datos de la red. 
- Al reducir el consumo de datos, disminuimos la cantidad de energía que requerimos por comunicación y procesamiento.

La integracion al proyecto de la libreria fue realizada mediante Carthage.

Link al repo de [SDWebImages](https://github.com/SDWebImage/SDWebImage).

## Permisos
Para poder realizar la descarga de las imagenes, se debio solicitar el acceso agregar una propiedad en el archivo `info.plist`. 
La propiedad que tenemos que agregar es  `Allow arbitrary loads` en `YES`.


## License
[MIT](https://choosealicense.com/licenses/mit/)
