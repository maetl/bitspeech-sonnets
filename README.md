# Bitspeech

This is a computer-generated book produced for [NaNoGenMo 2019](https://github.com/NaNoGenMo/2019).

## Details

- [Entry on the NaNoGenMo 2019 repo](https://github.com/NaNoGenMo/2019/issues/128)

## Summary

The book is made using ‘Bitspeech’ which is a method for translating base 16 hex values into words by mapping the underlying input value into chunks of bits which map to lookup tables of vowels and consonants.

Generating the book of sonnets starts with a lexicon of constructed Bitspeech words along with additional data on their syllable counts and phonetics. Each poem starts by randomly picking a list of end rhymes from the lexicon to match the sonnet rhyme scheme, then working backwards to fill out each line in the poem with the expected number of syllables.

## Install

Use Bundler to install the required Gems.

```
bundle
```

## Run

Run the `build` task using Rake to output a PDF. By default, it goes into the `output` directory.

```
rake generate
```

## License

The MIT License (MIT)

Copyright © 2019 Mark Rickerby https://maetl.net

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
