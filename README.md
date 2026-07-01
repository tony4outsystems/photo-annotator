# photo-annotator

Capacitor plugin for annotating photos on iOS.

## Install

To use npm

```bash
npm install @tony4outsystems/photo-annotator
````

To use yarn

```bash
yarn add @tony4outsystems/photo-annotator
```

Sync native files

```bash
npx cap sync
```

## API

<docgen-index>

* [`annotatePhoto(...)`](#annotatephoto)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### annotatePhoto(...)

```typescript
annotatePhoto(options: { uri: string; }) => Promise<{ uri: string; modified: boolean; }>
```

| Param         | Type                          |
| ------------- | ----------------------------- |
| **`options`** | <code>{ uri: string; }</code> |

**Returns:** <code>Promise&lt;{ uri: string; modified: boolean; }&gt;</code>

--------------------

</docgen-api>
