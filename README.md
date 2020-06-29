# NHS login demo integration

This is a demo app to show the integration of RoR being able to integrate with NHS login.

## Getting started

The instructions will help you to get the application running
locally on your machine.

### Prequisites

- Ruby 2.6.6
- JavaScript runtime: https://github.com/rails/execjs e.g nodejs  
  
### Running the application

- Clone the application
- Run `bundle` from the terminal
- Copy your private key into `private_key.pem`
- Create the following file `config/application.yml`
- Fill in the config file, below is an example:
```
ISSUER: 'auth.sandpit.signin.nhs.uk'
REDIRECT_URL: 'http://localhost:3000/auth/oidc/callback'
CLIENT_ID: 'YOUR-NHS-LOGIN-CLIENT-ID'
VTR: '["P0.Cp.Cd", "P0.Cp.Ck", "P0.Cm"]' 
SCOPES: 'openid profile'
```

Run the following to set up the local version of DynamoDB

```
    docker pull amazon/dynamodb-local
    docker run -d -p 8000:8000 amazon/dynamodb-local
```

Run `rails server`

### Viewing dynamodb records

Perhaps the simplest way to view the records is via the CLI command

```
aws dynamodb scan --table-name svp-development --endpoint-url http://localhost:8000 --region 'eu-west-2'
```

Which will output the contents of the table in json format.

## Licence

[MIT License](LICENCE)
