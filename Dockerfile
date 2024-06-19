# Use an official Node.js runtime as the base image
FROM node:12

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY ./src/package*.json ./

# Install any needed packages specified in package.json
RUN npm install

# Install bootstrap-tagsinput
#RUN npm install bootstrap-tagsinput

# Install grunt-cli globally
RUN npm install -g grunt-cli

# Install bower
RUN npm install -g bower

# Bundle app source inside the Docker image
COPY ./src .

# Run bower install with --allow-root option
RUN bower install --force

# Run grunt build:angular
RUN grunt build:angular

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define the command to run the app
CMD ["npm", "start"]