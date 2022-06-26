# AqNiyet

Web application on Flutter to confirm email and reset password from Supabase callback.

## Requests

Change password callback:

```html
http://localhost:3000/#access_token=<access_token>&expires_in=1000&refresh_token=<refresh_token>&token_type=bearer&type=recovery
```

Email confirmed callback:

```html
http://localhost:3000/#access_token=<access_token>&expires_in=1000&refresh_token=<refresh_token>&token_type=bearer&type=email_change
```

Error callback:
```html
http://localhost:3000/#error_code=404&error_description=User+not+found
```