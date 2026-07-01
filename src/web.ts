import { WebPlugin } from '@capacitor/core';

import type { PhotoAnnotatorPlugin } from './definitions';

export class PhotoAnnotatorWeb extends WebPlugin implements PhotoAnnotatorPlugin {
  async annotatePhoto(): Promise<{ uri: string; modified: boolean }> {
    throw this.unavailable('Photo annotation is only available on iOS.');
  }
}
