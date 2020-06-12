# Code generator from Swagger/OpenAPI specifications

Windows PowerShell script for client code generation, given a Swagger/OpenAPI specification.  
It requires Docker Desktop to run.  
  
Currently there are two teams working on similar projects (see "Readings" below).  
Scripts contains both version but the Swagger CodeGen is the one currently selected.  

## Usage

Customize generate.ps1 script by settings its param section:

    param (
        $name,
        $source='https://webservices-test.scientificnet.org/rest/biodiversity/swagger/docs/V1',
        $lang='typescript-angular',
        $config='angular-config.sc.json'
    )

and then execute it:

    .\generate.ps1

Alternatively you can pass parameters in the cli:

    .\generate.ps1 -name MySampleSDK -source http://petstore.swagger.io/v2/swagger.json -lang typescript-angular -config angular-config.sc.json

# Languages tool

Retrieve info about supported languages and related config.  

## Usage

    .\lang.ps1

# Readings

swagger-codegen  
https://swagger.io/tools/swagger-codegen/

openapi-generator  
https://openapi-generator.tech/

Discussions  
https://stackoverflow.com/questions/58482822/openapi-tools-generator-vs-swagger-codegen
