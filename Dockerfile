# Use an official Node.js runtime as the base image
FROM node:12

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./


# Install any needed packages specified in package.json
RUN npm install


# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define the command to run the app mode dev
CMD ["npm", "run", "dev"]
#CMD ["npm", "start"]