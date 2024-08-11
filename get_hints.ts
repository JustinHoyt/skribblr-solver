#! /usr/bin/env bun

import { $ } from "bun";

for await (const line of $`cat dictionary.txt`.lines()) {
  const actualWordLengths = line.split(/\s+/).map((x) => x.length);
  const expectedWordLengths = process.argv.slice(2).map(Number);

  if (Bun.deepEquals(actualWordLengths, expectedWordLengths)) console.log(line);
}
