# Yellow Systems interview task

## Features:
 - [Authentication](#authentication)
 - [Documentation](#api-documentation)

### Authentication
1. Create new account: `POST /api/auth`

 | Params | Values |
 | ------------- | ------------- |
 | email | Your email |
 | password | Password entered into registration form |
 | password_confirmation | Password confirmation entered into registration form |


 2. Log in: `POST /api/auth/sign_in`

 | Params | Values |
 | ------------- | ------------- |
 | email | Your email |
 | password | Your password |

 3. Make a request: `GET /api`

 | Headers | Values |
 | ------------- | ------------- |
 | uid | UID from log in response headers |
 | client | Client from log in response headers |
 | access-token | Access token log in response headers |

### API Documentation
Avaliable at `api/swagger_doc` without any authentication
