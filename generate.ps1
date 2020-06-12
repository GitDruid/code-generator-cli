#
# Script: Code generator from Swagger/OpenAPI specifications.
# Author: Alessandro Galasso.
# Requires: Docker Desktop.
#
param (
    #[Parameter(Mandatory)]
    $name,

    #[Parameter(Mandatory)]
    $source='http://petstore.swagger.io/v2/swagger.json',

    #[Parameter(Mandatory)]
    $lang='typescript-angular',

    $config='angular-config.sc.json'
)

if ($name -eq $null -or $name -eq '') {
    $name = New-Guid
}

$title = "
Going to create API client
==========================
Name:            '$name'
Source:          '$source'
Target language: '$lang'
Extra config:    '$config'
Folder:          '${PWD}\out\$name\$lang'

"

$question = 'Are you sure you want to proceed?'
$choices  = '&Yes', '&No'
$decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
if ($decision -eq 0) {
    Write-Host 'confirmed'
} else {
    Write-Host 'cancelled'
    Exit 1
}

# swagger-codegen
# https://swagger.io/tools/swagger-codegen/
#
if ($config -ne $null -or $config -ne '') {
    docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli generate -i $source -l $lang -o /local/out/$name/$lang -c /local/$config
} else {
    docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli generate -i $source -l $lang -o /local/out/$name/$lang
}

# openapi-generator
# https://openapi-generator.tech/
#
#if ($config -ne $null -or $config -ne '') {
#    docker run --rm -v "${PWD}:/local" openapitools/openapi-generator-cli generate -i $source -g $lang -o /local/out/$name/$lang -c /local/$config
#} else {
#    docker run --rm -v "${PWD}:/local" openapitools/openapi-generator-cli generate -i $source -g $lang -o /local/out/$name/$lang
#}
