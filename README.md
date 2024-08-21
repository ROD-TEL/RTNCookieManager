Module pour gérer les cookies HttpOnly dans React Native

A insérer dans le code :

```js
import CookieManager from 'RTNCookieManager'

const getHttpOnlyCookies = async url => {
  try {
    const cookies = await CookieManager.getHttpOnlyCookies(url)
    console.log('Cookies HttpOnly pour', url, ':', cookies)
  } catch (error) {
    console.error('Erreur lors de la récupération des cookies :', error)
  }
}

getHttpOnlyCookies(url)
```
