# rest-on-couch-docker
Docker image for rest-on-couch services

In order to create a new docker image containing the rest-on-couch project you need:
* create a release of rest-on-couch and publish it on npm
* set the new version in Dockerfile and add the change: `git add Dockerfile`
* run `npm version x.y.z -f`
* run `git push --follow-tags`

The build will be started automatically by docker.
