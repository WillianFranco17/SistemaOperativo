Willian Enrique Franco Campos-------Banco Popular

***<h1 align="center">Taller de Docker</h1>***

## Primera Parte:

* Configuracion de herramientas de desarrollo:

Descargamos la herramientas de Visual Studio Code y MobaXterm, en el caso del VSC configuramos el entorno a nuestro gusto y las extensiones que creamos necesarias, es importante dejar configurado la herramienta de GitBash en el entorno para asi trabajar los comandos de Git en los repositorios que trabajemos de manera local; en el MobaXterm configuramos el entorno de trabajo con la IP que nos es asignada por AWS y la llave que estos nos facilitan para tener el acceso correspondiente a la maquina asignada.

![herramientas dev](img/01.jpg)

* Crear cuenta en GitHub:

Ingresamos al enlace: https://github.com/join, completamos el formulario y confirmamos la cuenta en el correo con el cual nos inscribimos.

![formulario git](img/02.jpg)

Cuando la cuenta esta creada podemos personalizarla a nuestro gusto y comenzar a crear nuestros repositorios.

![perfil github](img/03.jpg)

* Crear cuenta en DockerHub:

Ingresamos al enlace: https://hub.docker.com/signup, completamos el formulario y confirmamos la cuenta en el correo con el cual nos inscribimos.

![formulario docker](img/04.jpg)

Cuando la cuenta esta creada podemos comenzar a crear nuestros repositorios.

![entorno docker](img/05.jpg)

* Creacion del Repositorio:

En la ventana de nuestro perfil seleccionamos la pestaña de repositorios, y en esta seleccionamos el boton verde que dice "New"

![pagina git](img/06.jpg)

Se despliega una nueva ventana en la cual establecemos el nombre de nuestro repositorio, el dominio que este va a tener, y si queremos incluir un archivo README.md

![creacion repo](img/07.jpg)

* Configuracion de llaves SSH

1. Extraccion de la llave de GitHub:

En nuestra imagen ingresamos el comando "ssh-keygen", dependiendo la ruta que este nos de las escribimos con el comando "cat" y asi obtndremos la infomacion de la llave ssh de nuestra maquina, este proceso funciona tanto para maquinas virtuales como de manera local.

![llave ssh](img/08.jpg)

2. Agregar llave en GitHub:

* En la pagina principa en la parte superior derecha desplegamos las opciones y seleccionamos la que die "Settings"

![settings](img/09.jpg)

* Dentro de esta opcion nos dirijimos a la columna izquierda y seleccionamos la opcion de "SSH and GPG keys"

![llaves git](img/10.jpg)

* En ese ventana damos click en la opcion "New SSH key"

![nueva ssh](img/11.jpg)

* Establecemos el nombre que va a tener nuestra llave (ya que pueden haber mas llaves dependiendo los entornos de trabajo), y pegamos la informacion que extragimos de nuestro entorno de trabajo.

![configuracion](img/12.jpg)

## Segunda Parte:
