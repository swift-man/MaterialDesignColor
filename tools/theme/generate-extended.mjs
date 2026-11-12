import {readFileSync, writeFileSync} from 'node:fs';
import {extended} from './generate.mjs';

const path = new URL('../../tokens/material3/extended-color-schemes.json', import.meta.url);
const tokens = JSON.parse(readFileSync(path));
writeFileSync(path, JSON.stringify({...tokens, ...extended(tokens.sourceColor)}, null, 2) + '\n');
