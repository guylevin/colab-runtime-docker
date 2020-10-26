# Local Runtime for Google Colab

This is a Docker container to use as a local runtime for Google Colab


## Build Container
`docker build --tag guylevin/colab:latest .`


## Run Container
`docker run --rm -it  -p 8888:8888 --ipc=host guylevin/colab:latest`


When the container will finish loading, it will print a URL  
Copy that URL, *replace the written IP address (e.g. 127.0.0.1) with localhost*

On Colab click on connect to a local runtime, insert the edited URL and accept

### Notes

>Does not suppot GPU yet
