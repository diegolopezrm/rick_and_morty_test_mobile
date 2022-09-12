# Rick And Morty Test Mobile

![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/63005462/189683148-f1dc7c17-0316-4559-a4ad-b3cb21bdb934.gif)


SDK Flutter 2.10.5 

## Getting Started

Funcionalidades requeridas:
- Listar los personajes: Al ingresar a la aplicación, se deben listar todos los personajes con
su nombre, foto, estado y especie.
- Consultar un personaje: Al presionar sobre el personaje o su nombre, se debe ver el detalle
y su información completa en otro screen.
- Manejo de errores al consultar el API.

Funcionalidades opcionales:
- Paginación en el listado de personajes, con scroll infinito.
- Acortar los textos con puntos suspensivos cuando la resolución lo requiera.
- El número de episodios en el detalle del personaje.
- La sección “la serie en números”: número de episodios y el nombre del location con más
personajes.

Criterios a evaluar:
- Estructura lógica del código.
- Uso de estilos y diseño de la aplicación.
- Similitud con el diseño propuesto.
- No se puede utilizar el dart wrapper que proporciona la documentación.

## Como usar 

**Paso 1:**

Download or clone this repo by using the link below:

```
https://github.com/zubairehman/flutter-boilerplate-project.git
```

**Paso 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Paso 3:**

Correr el projecto en un emulador o en un dispositivo fisico.

 A partir de la siguiente configuración:
 
 ```
 "configurations": [

        {
            "name": "alfred_test",
            "request": "launch",
            "type": "dart",
            "args": [
                "--no-sound-null-safety"
            ]
        },
        {
            "name": "alfred_test (profile mode)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile",
            "args": [
                "--no-sound-null-safety"
            ]
        },
        {
            "name": "alfred_test (release mode)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release",
            "args": [
                "--no-sound-null-safety"
            ]
        }
    ]
 ```

# Para generar las apk

Necesitas correr el siguiente comando:

```
flutter build apk --split-per-abi  --no-sound-null-safety

```



## Librerias utilizadas
```
cupertino_icons: ^1.0.2
http: ^0.13.3
flutter_launcher_icons: ^0.10.0
paging: ^0.1.0
infinite_scroll_pagination: ^2.3.0
```


## Fuentes utilizadas
```
fonts:
    - family:  Gilroy
      fonts:
        - asset: assets/fonts/Gilroy-ExtraBold.otf
        - asset: assets/fonts/Gilroy-Light.otf
```


## Recomendaciones

*Utilizar el manejador de versiones FVM 
```
https://fvm.app/es/
```

## Conclusiones 

Estaré encantado de responder cualquier pregunta que pueda tener sobre este enfoque, y si desea ayudar con el modelo estándar, no dude en enviar un problema y/o una solicitud de extracción 🙂

Una vez más, tenga en cuenta que este ejemplo puede parecer demasiado arquitectónico para lo que es. Si te gustó mi trabajo, no olvides ⭐ destacar el repositorio para mostrar tu apoyo.

Me encantaría trabajar con ustedes. :)
 
