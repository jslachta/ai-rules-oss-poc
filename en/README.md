[Čeština](../README.md) · **English**

# Rules for AI-Assisted Development

A framework for managing the risks of developing software with AI assistance —
and just as well without it. It is written as a template to adopt and adapt,
not as a finished corporate policy.

**[Download the current PDF](https://github.com/jslachta/ai-rules-oss-poc/raw/releases/ai-dev-rules-en.pdf)**

The companion text **[Why these rules](https://github.com/jslachta/ai-rules-oss-poc/raw/releases/ai-dev-rules-motivation-en.pdf)**
explains the motivation behind the framework — what it grew out of and why it
matters.

This is the English translation of the [Czech original](../README.md) in the
repository root. Both variants are released under the same tag and carry the
same version; the English assets have the `-en` postfix.

## What it is about

The debate about AI in development usually circles the question of whether AI
may write production code. A more useful question is a different one: how much
damage a fault will cause, how quickly we will detect it and how easily we can
undo it. These questions held long before AI. AI does not change them — it only
speeds up the production of code, including the risk-bearing kind.

The framework rests on a few ideas:

- **Risk is measured along three axes** — blast radius, verifiability (how
  quickly a fault is detected) and reversibility (how easily it is undone). A
  large impact that is reversible is manageable; a small impact that is
  irreversible may not be.
- **Taking ownership of the code** — what decides is not whether AI wrote the
  code, but whether the developer understands it, can defend it and can back it
  up. Whatever clears that bar may go even into risk-bearing areas; whatever
  does not may go nowhere.
- **Established vs. new projects** — the rules differ depending on whether a
  codebase with history already exists, or the boundaries are still being drawn.
- **Boundaries can be designed** — a suitable architecture shrinks the
  risk-bearing core so that most of the code falls into the low-risk zone, where
  AI can work almost without restriction.

The document has two parts: a **binding policy** (Part A) and **best practices**
(Part B).

## Who it is for

For development teams that want to use AI judiciously — without a blanket ban
and without unconditional adoption. Passages such as the escalation authority
are deliberately generic and expect to be filled in according to a specific
organisational structure.

## Build

The source is LaTeX (XeLaTeX). The PDF is not edited by hand, it is generated
from the source. Build from the repository root:

```sh
make en       # both English PDFs (ai-rules + motivation)
make          # all four PDFs (cs + en)
make clean    # remove auxiliary files
```

The English documents are compiled from inside `en/`, so that
`\input{preamble.tex}` picks up the English preamble (language, quotation
marks). Everything else in the preamble is identical to the Czech one.

## Keeping the two in sync

A change of substance belongs in both language variants in the same merge
request — they are released under one tag and one version number. The section
structure and the one-sentence-per-line convention are shared, so the two files
diff against each other line by line.

## Contributing

Comments, challenges and experience from practice are welcome — the framework
came out of practice and practice sharpens it. See
[CONTRIBUTING.md](../CONTRIBUTING.md) (in Czech).

## Licence

[CC-BY 4.0](../LICENSE) — free use including commercial, the only condition
being attribution.
