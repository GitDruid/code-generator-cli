param (
    #[Parameter(Mandatory)]
    $name,

    #[Parameter(Mandatory)]
    $source='https://webservices-test.scientificnet.org/rest/biodiversity/swagger/docs/V1',

    #[Parameter(Mandatory)]
    $lang='typescript-angular',

    $configFile='angular-config.sc.json'
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
Extra config:    '$configFile'
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

if ($configFile -ne $null -or $configFile -ne '') {
    $configFlag = "-c /local/$configFile"
} else {
    $configFlag = ""
}
 
# swagger-codegen
# https://swagger.io/tools/swagger-codegen/
docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli generate -i $source -l $lang -o /local/out/$name/$lang $configFlag
#
# GET LANGUAGE SPECIFIC CONFIG SETTINGS
#docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli config-help -l $lang

# openapi-generator
# https://openapi-generator.tech/
#docker run --rm -v "${PWD}:/local" openapitools/openapi-generator-cli generate -i $source -g $lang -o /local/out/$name/$lang $configFlag
#
# GET LANGUAGE SPECIFIC CONFIG SETTINGS
#docker run --rm -v "${PWD}:/local" openapitools/openapi-generator-cli config-help -g $lang


#
#
# Readings:
# https://stackoverflow.com/questions/58482822/openapi-tools-generator-vs-swagger-codegen
#
#
