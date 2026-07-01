# AI-asistovaný vývoj — pravidla pro projekty (sloučený draft)

Interní směrnice (závazná část A) + best practices (část B) pro AI-asistovaný vývoj,
rozdělené pro dlouhodobé/zavedené a nové projekty.

> **Stav: DRAFT.** Vše je sloučeno do jediného `ai-rules.tex` kvůli snazší ruční revizi.
> Po zamrznutí draftu lze opět rozdělit na `sekce/*.tex` (sekce jsou v souboru
> vyznačené komentáři `% SEKCE: ...`).

## Obsah

- **Část A** — závazná pravidla (vč. A1.7: data pod NDA a nedůvěryhodné AI nástroje)
- **Část B** — doporučení (vč. B4: rozhodovací škála režimů práce s AI pod NDA)
- Onboarding checklisty, kategorizace projektu, šablona ADR

## Build

Vyžaduje TeX Live s `xelatex`.

```sh
make          # vytvoří ai-rules.pdf (dvojí běh kvůli TOC a LastPage)
make clean    # smaže pomocné soubory
make watch    # průběžný build (vyžaduje latexmk)
```

## Struktura ai-rules.tex

- řádky po `\begin{document}` — preambule, styl, paleta, makra
- dále sedm sekcí oddělených komentářem `% SEKCE: <jmeno>.tex`

## Metadata a klasifikace dokumentu

Titul, PDF subjekt a klasifikaci v patičce řídí makra `\doctitle`, `\docsubject`
a `\docclass` v `preamble.tex`; každý dokument je může přepsat přes `\renewcommand`
(viz `motivace.tex`). Při převzetí šablony jako interní směrnice změň `\docclass`
na `Interní` — jde o jediné místo pro oba dokumenty.

## Konvence

- **One-sentence-per-line**: změna věty = jeden řádek v diffu.
- PDF se needituje ručně ani neverzuje (viz `.gitignore`); buduje se z `.tex`.
- Konkrétní projekty se zde neuvádějí — budou předmětem samostatného vzorového dokumentu.
