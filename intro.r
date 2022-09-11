# INTRODUCCIÓN A R -------
# Script: zero2hero 
# Instructor: BlankHall

# 1. VARIABLES
edad <- 24
nombre <- 'Jonatan'
apellido <- 'Blank'
email <- "blankhall@ciencias.unam.mx"
es_mujer <- FALSE
es_mexicano <- TRUE

# 2. OPERACIONES MATEMATICAS
x <- 100
y <- 10

#suma
x+y
#resta
x-y
#multiplicacion
x*y
#division
x/y
#potencia
2^{4}
x^{y}
#modulo
10%%3

# 3. OPERACIONES LOGICAS

#regla de la tricotomia
x <- 10
y <- 10

#mayor que
x > y
#menor que
x < y
#exactamente igual que
x == y

# 4. CONJUNTOS LOGICOS
edad <- 40
sexo <- 'M'

#or
edad > 18 | sexo == 'M'

#and
edad > 18 && sexo == 'M'

#ejemplo
usuario <- 'johnnybonny'
contraseña <- '1234'

usr_usuario <- 'johnnybonny'
usr_contraseña <- '1234'

usuario == usr_usuario && contraseña == usr_contraseña

# 5. CONDICIONALES
nombre <- 'Jonatan'
if(nombre == 'Jonatan'){
  print('Buenas tardes Jonatan')
}else{
  print('Tu no eres Jonatan')
}

if(usuario == usr_usuario && contraseña == usr_contraseña){
  print('Bienvenido :)')
}else{
  print('Usuario o Contraseña incorrectos')
}

# 6. VECTORES
#primer tipo de almacenamiento de datos
edades <- c(13:45)

n <- 4 
gauss <- c(1:n)
(n)*(n+1)/2
#suma de los valores
sum(gauss)
# cantidad de valores
length(gauss)
# valor maximo
max(gauss)
#valor minimo
min(gauss)
#comprobar existencia de un elemento
5 %in% gauss

# 7. CICLOS
for(i in 1:10){
  print(i)
}

amigos <- c('Pepe','Juan','Raul')

for(i in amigos){
  print(i)
}

dias <- c(1:10)
for(d in dias){
  y <- d^2
  print(y)
}

#ciclo for + condicional if
clientes <- c(19,21,17,16,19,20,30,21,60,65)

for(c in clientes){
  if(c > 17 && c < 61){
    print('Puedes Pasar!')
  }
  if(c < 18){
    print('No puedes pasar, eres muy joven')
  }
  if(c > 60){
    print('No puedes pasar, eres muy viejo')
  }
}

# 8. FUNCIONES
valores <- c(100,120,70,80,65,105,99)

sum(valores)

suma <- function(lista){
  s <- 0
  for(v in lista){
    s <- s+v
  }
  return(s)
}

suma(valores)
suma(c(10,10,10))

saludar <- function(nombre,apellido,edad){
  print(paste('Buenos días',nombre,apellido,'de',edad,'años de edad'))
}

saludar('Jonatan','Blank',24)

despedirse <- function(){
  print('Hasta luego')
}

despedirse()

# 9. Introducción a la estadística

#numeros aleatorios
media_teorica = 40
desviacion_teorica = 15

muestreo <- rnorm(200,mean=media_teorica,sd=desviacion_teorica)


media_estadistica <- mean(muestreo)
desviacion_estadistica <- sd(muestreo)

print(paste('Diferencia en media',abs(media_teorica-media_estadistica)))
print(paste('Diferencia en desviacion',abs(desviacion_teorica-desviacion_estadistica)))

#ejemplo poblacional
n = 200
edades <- rnorm(n,40,15)
summary(edades)

hist(edades,breaks=10)
plot(edades)
boxplot(edades)

# salario(edad) = 6000 + 100*edad + e
rel_salario <- function(edad){
  y = 6000 + 100*edad + rnorm(length(edad),0,1500)
  return(y)
}

salarios <- rel_salario(edades)
hist(salarios)

plot(edades,salarios)

# 10. LIBRERIAS EXTERNAS

#ggplot2
install.packages('ggplot2')
library(ggplot2)

#dplyr
install.packages('dplyr')
library(dplyr)

# 11. MI PRIMERA BASE DE DATOS

nombres <- c('Pepe','Juan','Pablo')
edades <- c(25,24,23)
sexo <- c('M','M','M')
salario <- c(10000,18000,6000)

AMIGOS <- data.frame(
  'nombre' = nombres,
  'edad' = edades,
  'sexo' = sexo,
  'salario' = salario
)

#NOMBRE DE LAS COLUMNAS
names(AMIGOS)

#CANTIDAD DE OBSERVACIONES
length(AMIGOS)

#DIMENSION DE LA BASE
dim(AMIGOS)

#ACCEDER A COLUMNA PARTICULAR
age <- AMIGOS$edad
age <- AMIGOS[['edad']]
age <- AMIGOS[,2]

sum(age)
mean(age)
sd(age)

#ACCEDER A UN RENGLON
AMIGOS[1,]

# EJEMPLO: Deseamos imprimir:
# Este es mi amigo jonatan, de 24 años de edad. 
# El es hombre y gana $300 pesos mensuales.
num_amigos <- dim(AMIGOS)[1]
for(i in 1:num_amigos){
  nom = AMIGOS[i,1]
  ed = AMIGOS[i,2]
  sex = AMIGOS[i,3]
  sal = AMIGOS[i,4]
  if(sex == 'M'){
    sexo_definido <- 'Hombre'
  }else{
    sexo_definido <- 'Mujer'
  }
  if(sal > 9000){
    print(paste('Este es mi amigo',nom,'de',ed,'años de edad.'))
    print(paste('El es',sexo_definido,'y gana $',sal,'mensuales'))
  }
}

#agregar nuevas columnas
color_favorito <- c('Verde','Naranja','Rojo')

AMIGOS['color favorito'] <- color_favorito

AMIGOS['mascota'] <- c(T,F,T)

#agregar nueva observacion
num_obs <- dim(AMIGOS)[1]
AMIGOS[num_obs+1,] <- c('Julieta',20,'F',14000,'Morado',T)
AMIGOS[num_obs+2,] <- c('Romina',25,'F',17000,'Morado',T)

#tipos de datos en dataframes
AMIGOS$sexo <- as.factor(AMIGOS$sexo)
AMIGOS$`color favorito` <- as.factor(AMIGOS$`color favorito`)
AMIGOS$mascota <- as.factor(AMIGOS$mascota)
AMIGOS$edad <- as.numeric(AMIGOS$edad)
AMIGOS$salario <- as.numeric(AMIGOS$salario)

barplot(table(AMIGOS$sexo,AMIGOS$`color favorito`))