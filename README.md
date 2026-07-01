# photo-annotator

TODO

## Install

To use npm

```bash
npm install photo-annotator
````

To use yarn

```bash
yarn add photo-annotator
```

Sync native files

```bash
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`annotatePhoto(...)`](#annotatephoto)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


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
