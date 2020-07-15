#
# Script: Language info for code generator.
# Author: GitDruid.
# Requires: Docker Desktop.
#

param (
    [Parameter()]
    [ValidateSet('swagger-codegen','openapi-generator')]
    $framework='swagger-codegen'
)

$title = "
Available languages and settings
================================
Framework:       '$framework'

"

Write-Host $title

if ($framework -eq 'swagger-codegen') {

    # swagger-codegen
    # https://swagger.io/tools/swagger-codegen/
    docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli langs
    $lang = Read-Host 'Type the language you need'
    docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli config-help -l $lang

} elseif ($framework -eq 'openapi-generator') {

    # openapi-generator
    # https://openapi-generator.tech/
    docker run --rm -v "${PWD}:/local" openapitools/openapi-generator-cli list
    $lang = Read-Host 'Type the language you need'
    docker run --rm -v "${PWD}:/local" openapitools/openapi-generator-cli config-help -g $lang

} else {

    Write-Host 'Not supported framework.'

}