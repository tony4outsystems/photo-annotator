import { registerPlugin } from '@capacitor/core';

import type { PhotoAnnotatorPlugin } from './definitions';

const PhotoAnnotator = registerPlugin<PhotoAnnotatorPlugin>('PhotoAnnotator', {
  web: () => import('./web').then((m) => new m.PhotoAnnotatorWeb()),
});

export * from './definitions';
export { PhotoAnnotator };
