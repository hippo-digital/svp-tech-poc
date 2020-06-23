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

Run `rails server`

## Licence

[MIT License](LICENCE)
