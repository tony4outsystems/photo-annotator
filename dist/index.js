import { registerPlugin } from '@capacitor/core';
const PhotoAnnotator = registerPlugin('PhotoAnnotator', {
    web: () => import('./web').then((m) => new m.PhotoAnnotatorWeb()),
});
export * from './definitions';
export { PhotoAnnotator };
//# sourceMappingURL=index.js.map