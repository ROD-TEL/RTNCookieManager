import { TurboModule, TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  getHttpOnlyCookies(url: string): Promise<Array<{name: string, value: string, domain: string, path: string}>>;
}

export default TurboModuleRegistry.getEnforcing<Spec>('RTNCookieManager');

