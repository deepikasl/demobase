# demobase

* Used to create base image for use in the Shippable demos
* For demo purposes, after generating image, flatten the image by:
  * Run the demobase image in a container
  * Export the container and import it to a new image:  
    `$ docker export {container id} | docker import - shippabledemo/demobase:{tag}`
  * Push the flattened image to Docker Hub
