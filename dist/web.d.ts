import { WebPlugin } from '@capacitor/core';
import type { PhotoAnnotatorPlugin } from './definitions';
export declare class PhotoAnnotatorWeb extends WebPlugin implements PhotoAnnotatorPlugin {
    annotatePhoto(): Promise<{
        uri: string;
        modified: boolean;
    }>;
}
