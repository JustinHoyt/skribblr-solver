#! /usr/bin/env -S deno run -A

import { TextLineStream } from "jsr:@std/streams/text-line-stream";

class filterMatches extends TransformStream<string, string> {
  constructor(expectedWordLengths: string) {
    super({
      transform: (line, controller) => {
        const actualWordLengths = line
          .split(/\s+/)
          .map((x) => x.length)
          .join(" ");

        if (actualWordLengths === expectedWordLengths) {
          controller.enqueue(line);
        }
      },
    });
  }
}

await Deno.openSync("./dictionary.txt").readable
  .pipeThrough(new TextDecoderStream())
  .pipeThrough(new TextLineStream())
  .pipeThrough(new filterMatches(Deno.args.join(" ")))
  .pipeTo(new WritableStream({ write: (line) => console.log(line) }));
