#!/bin/bash

cat ./Diagrams/DatabaseServer/deployment.iuml | docker run --rm -i think/plantuml -tpng > ./Diagrams/DatabaseServer/deployment.png
cat ./Diagrams/DatabaseServer/deployment.iuml | docker run --rm -i think/plantuml -tsvg > ./Diagrams/DatabaseServer/deployment.svg
