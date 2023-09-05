
# Use the official python image as base image
FROM python:3.9-slim-buster

# to set working directory in the container
WORKDIR /app

#Cpoy the requirements file to the working directory
COPY requirements.txt .

# Install the required python packages
# Added this line because the python image we used has no gcc so it gave error while installing "psutil" package
RUN apt-get update -y && apt-get install -y gcc
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the application code to working directory
COPY . .

# Set the environment variables for flask app
ENV FLASK_RUN_HOST=0.0.0.0

# Expose the port on which flsk app will run
EXPOSE 5000

# To start the flask app when the container is up
CMD ["flask", "run"]


