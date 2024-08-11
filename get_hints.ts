#! /usr/bin/env bun

const lines = (await Bun.file("./dictionary.txt").text()).split(/\n/);
for (const line of lines) {
  const actualWordLengths = line.split(/\s+/).map((x) => x.length);
  const expectedWordLengths = process.argv.slice(2).map(Number);

  if (Bun.deepEquals(actualWordLengths, expectedWordLengths)) console.log(line);
}
