export interface PhotoAnnotatorPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  annotatePhoto(options: { uri: string }): Promise<{ uri: string; modified: boolean }>;
}
