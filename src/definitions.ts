export interface PhotoAnnotatorPlugin {
  annotatePhoto(options: { uri: string }): Promise<{ uri: string; modified: boolean }>;
}
