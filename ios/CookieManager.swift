import Foundation
import WebKit

@objc(RTNCookieManager)
class CookieManager: NSObject {
  
  @objc
  func getHttpOnlyCookies(_ url: String, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
      guard let url = URL(string: url) else {
          reject("INVALID_URL", "L'URL fournie n'est pas valide", nil)
          return
      }
      
      WKWebsiteDataStore.default().httpCookieStore.getAllCookies { cookies in
          let httpOnlyCookies = cookies.filter { $0.isHTTPOnly && $0.domain == url.host }
          let cookieDict = httpOnlyCookies.map { [
              "name": $0.name,
              "value": $0.value,
              "domain": $0.domain,
              "path": $0.path
          ] }
          resolve(cookieDict)
      }
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}

