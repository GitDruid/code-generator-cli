#
# Script: Language info for code generator.
# Author: GitDruid.
# Requires: Docker Desktop.
#

# swagger-codegen
# https://swagger.io/tools/swagger-codegen/
docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli langs
$lang = Read-Host 'Type the language you need'
docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli config-help -l $lang

# openapi-generator
# https://openapi-generator.tech/
#docker run --rm -v "${PWD}:/local" openapitools/openapi-generator-cli list
#$lang = Read-Host 'Type the language you need'
#docker run --rm -v "${PWD}:/local" openapitools/openapi-generator-cli config-help -g $lang
