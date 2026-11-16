# Imagen base oficial de Node.js en modo desarrollo
FROM node:22.23.1-slim

# Directorio de trabajo en el contenedor
WORKDIR /app

# Copiar archivos de dependencias
COPY package*.json ./

# Instalar dependencias del proyecto (utilizando --force por compatibilidad de paquetes en React 19)
RUN npm install --force

# Copiar el resto del codigo fuente
COPY . .

# Exponer el puerto de desarrollo de Vite
EXPOSE 5173

# Levantar el servidor de desarrollo de Vite
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]

