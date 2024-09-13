# AWS SCABLE APP

###  Arquitectura
![Arquitectura](https://aws-scale-app.s3.us-east-2.amazonaws.com/aws-scable-app-architecture.jpg)

#### Descripcion
Este proyecto consiste en la implementación de una arquitectura en Amazon Web Services (AWS) diseñada para una aplicación web. La arquitectura está diseñada para ser escalable, altamente disponible y bien monitorizada.

#### Objetivo
El propósito de este proyecto es demostrar la capacidad para diseñar y desplegar una solución en la nube que cumpla con los requisitos de escalabilidad, disponibilidad y monitoreo, utilizando prácticas recomendadas para la administración de infraestructura en AWS

- Diseñar y desplegar una arquitectura en AWS para una aplicación web que sea escalable, altamente disponible y monitorizada.
- Implementar la infraestructura como código para facilitar el control, la actualización, la inclusión y el despliegue de componentes.
- Configurar notificaciones para mantener informados a los usuarios claves sobre eventos importantes en la arquitectura, como el lanzamiento o la eliminación de instancias debido al escalado automático.


#### Caracteristicas claves
Escalabilidad: La arquitectura utiliza Auto Scaling Groups (ASG) para ajustar automáticamente la capacidad de la infraestructura según la demanda. Esto asegura que la aplicación pueda manejar picos de tráfico sin problemas. Las configuraciones iniciales del ASG incluyen:
- Capacidad mínima: 1 instancia
- Capacidad deseada: 2 instancias
- Capacidad máxima: 3 instancias

**Alta disponibilidad**: La arquitectura está distribuida en varias zonas de disponibilidad para asegurar la continuidad del servicio en caso de fallos en una zona.

**Monitoreo**: Se implementan alarmas de CloudWatch para supervisar el estado y el rendimiento de la aplicación, permitiendo la detección temprana de problemas.

**Notificaciones**: Se configuran notificaciones para mantener a los usuarios informados sobre eventos clave en la arquitectura, como el lanzamiento o la eliminación de instancias debido al escalado automático

**Infraestructura como código**: La arquitectura está definida mediante plantillas de AWS CloudFormation, facilitando la administración, actualización y despliegue de la infraestructura de manera consistente y repetible.

**Almacenamiento de Objetos**: Se utiliza un bucket S3 para almacenar archivos HTML y plantillas anidadas. Estos archivos se utilizan para:

- Configuración Inicial: Al desplegar la arquitectura, se consumen archivos HTML y plantillas anidadas para configurar los componentes
- Instancias ASG: Las instancias lanzadas por el ASG acceden a estos archivos estáticos durante el lanzamiento inicial, permitiendo que se carguen y sean servidos por el servidor web .

#### Como iniciar la infraestructura
**Despliegue**: La infraestructura se despliega utilizando plantillas de CloudFormation, que configuran automáticamente los recursos necesarios en AWS.

#### Opciones de despliegue
**Consola de AWS**: Puedes utilizar la consola de AWS para cargar y desplegar la plantilla llamada compute.yaml.

**Línea de Comando (CLI)**: También puedes usar la CLI de AWS para realizar el despliegue. Se recomienda usar un archivo Makefile para definir los comandos necesarios, incluyendo:

- Despliegue: Comandos para crear o actualizar la pila.
- Parametrización: Configuración de parámetros para el despliegue.
- Actualización: Actualización de recursos existentes.
- Eliminación: Eliminación de recursos o de la pila completa.

#### Funcionamiento general de la arquitectura
**Auto Scaling Group (ASG)**: Al iniciar la creación de la arquitectura, como componente principal se inicia un Auto Scaling Group (ASG) utilizando la  capacidad deseada de 2 instancias.
**Configuración de Instancias**: Las instancias lanzadas utilizan una configuracion inicial definidas  en un script user-data que realiza las siguientes acciones:
- Instalación del Servidor Web: Se instala y configura el servidor web Apache.
- Inicio del Servidor Web: Se asegura que el servidor web esté en funcionamiento.
- Sincronización con S3: Las instancias sincronizan con un bucket S3 para obtener un archivo HTML que se servirá como el frontend de la aplicación.