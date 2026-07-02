import { WebPlugin } from '@capacitor/core';
export class PhotoAnnotatorWeb extends WebPlugin {
    async annotatePhoto() {
        throw this.unavailable('Photo annotation is only available on iOS.');
    }
}
//# sourceMappingURL=web.js.map