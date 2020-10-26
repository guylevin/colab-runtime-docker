# Local Runtime for Google Colab

This is a Docker container to use as a local runtime for Google Colab


## Build Container
`docker build --tag guylevin/colab:latest .`


## Run Container
`docker run --rm -it  -p 8888:8888 --ipc=host guylevin/colab:latest`


When container will finish loading, it will print a URL  
Copy that URL, *replace the written IP address with localhost*

On Colab click on connect to a local runtime, insert the edited URL and accept


>Does not suppot GPU yet
