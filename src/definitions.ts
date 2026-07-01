export interface PhotoAnnotatorPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
