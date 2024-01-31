# Code generator from Swagger/OpenAPI specifications

Windows PowerShell script for client code generation, given a Swagger/OpenAPI specification.  
It requires Docker Desktop.  
  
Currently there are two teams working on similar projects (see "Readings" below).  
Scripts can use both version. The Swagger CodeGen is the default selection if the $framework parameter is not provided.  

## Usage

Customize generate.ps1 script by settings its param section:

    param (
        $framework='swagger-codegen',
        $name,
        $source='http://petstore.swagger.io/v2/swagger.json',
        $lang='typescript-angular',
        $config='angular-config.sc.json'
    )

and then execute it:

    .\generate.ps1

Alternatively you can pass parameters in the cli:

    .\generate.ps1 -framework openapi-generator -name MySampleSDK -source http://petstore.swagger.io/v2/swagger.json -lang typescript-angular -config angular-config.sc.json

# Languages tool

Retrieve info about supported languages and related config.  

## Usage

    .\lang.ps1

or

    .\lang.ps1 -framework openapi-generator
    .\lang.ps1 -framework swagger-codegen

# Readings

swagger-codegen  
https://swagger.io/tools/swagger-codegen/

openapi-generator  
https://openapi-generator.tech/

Discussions  
https://stackoverflow.com/questions/58482822/openapi-tools-generator-vs-swagger-codegen

# Future enhancements

Integrate Kiota as new framework option  
https://learn.microsoft.com/en-us/openapi/kiota/overview
