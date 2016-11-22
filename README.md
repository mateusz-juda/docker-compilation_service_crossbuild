docker build --tag registry.capdnet:5000/docker-compilation_service_crossbuild .
docker push registry.capdnet:5000/docker-compilation_service_crossbuild

docker run -ti -e CROSS_TRIPLE=x86_64-apple-darwin -e DISTCCD_OPTS=--verbose -e ALLOW=0.0.0.0/0 -p 10001:3632
