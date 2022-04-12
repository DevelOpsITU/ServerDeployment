#!/bin/bash

cat ./Diagrams/DatabaseServer/deployment.iuml | docker run --rm -i think/plantuml -tpng > ./Diagrams/DatabaseServer/deployment.png
cat ./Diagrams/DatabaseServer/deployment.iuml | docker run --rm -i think/plantuml -tsvg > ./Diagrams/DatabaseServer/deployment.svg
cat ./Diagrams/ApplicationServer/deployment.iuml | docker run --rm -i think/plantuml -tpng > ./Diagrams/ApplicationServer/deployment.png
cat ./Diagrams/ApplicationServer/deployment.iuml | docker run --rm -i think/plantuml -tsvg > ./Diagrams/ApplicationServer/deployment.svg
cat ./Diagrams/MonitoringServer/deployment.iuml | docker run --rm -i think/plantuml -tpng > ./Diagrams/MonitoringServer/deployment.png
cat ./Diagrams/MonitoringServer/deployment.iuml | docker run --rm -i think/plantuml -tsvg > ./Diagrams/MonitoringServer/deployment.svg
cat ./Diagrams/MasterDeployment/deployment.iuml | docker run --rm -i think/plantuml -tpng > ./Diagrams/MasterDeployment/deployment.png
cat ./Diagrams/MasterDeployment/deployment.iuml | docker run --rm -i think/plantuml -tsvg > ./Diagrams/MasterDeployment/deployment.svg
