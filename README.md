# Pravidla pro AI-asistovaný vývoj

Rámec pro řízení rizik při vývoji softwaru s asistencí AI — a stejně tak
bez ní. Je koncipován jako šablona k převzetí a úpravě, nikoli jako hotová
firemní směrnice.

**[Stáhnout aktuální PDF](https://github.com/jslachta/ai-rules-oss-poc/raw/releases/ai-dev-rules.pdf)**

Doprovodný text **[Proč tato pravidla](https://github.com/jslachta/ai-rules-oss-poc/raw/releases/ai-dev-rules-motivace.pdf)**
vysvětluje motivaci za rámcem — z čeho vyrostl a proč na něm záleží.

## O co jde

Debata o AI ve vývoji se často vede kolem otázky, zda AI smí psát produkční
kód. Nosnější je ptát se jinak: jak velkou škodu chyba způsobí, jak rychle
ji odhalíme a jak snadno ji vrátíme. Tyto otázky platily dávno před AI. AI
je nemění — pouze zrychluje produkci kódu včetně toho rizikového.

Rámec stojí na několika myšlenkách:

- **Riziko se měří na třech osách** — dosah škody (blast radius),
  ověřitelnost (jak rychle se chyba pozná) a reverzibilita (jak snadno se
  vrátí). Velký dopad, který je vratný, je zvládnutelný; malý dopad, který
  je nevratný, zvládnutelný být nemusí.
- **Převzetí kódu jako vlastního** — rozhodující není, zda kód napsala AI,
  ale zda mu vývojář rozumí, umí jej obhájit a doložit. Co tuto laťku
  splní, smí i do rizikových oblastí; co ne, nesmí nikam.
- **Zavedené vs. nové projekty** — pravidla se liší podle toho, zda už
  existuje kódová báze s historií, nebo se hranice teprve staví.
- **Hranice lze navrhnout** — vhodná architektura zmenší rizikové jádro
  tak, že většina kódu spadne do nízkorizikové zóny, kde AI může pracovat
  téměř bez omezení.

Dokument má dvě části: **závaznou směrnici** (část A) a **best practices**
(část B).

## Pro koho

Pro vývojové týmy, které chtějí AI používat uvážlivě — bez plošného zákazu
i bez bezvýhradného nasazení. Pasáže jako eskalační autorita jsou záměrně
obecné a předpokládají doplnění podle konkrétní organizační struktury.

## Build

Zdroj je v LaTeXu (XeLaTeX). PDF se needituje ručně, generuje se ze zdroje.
Oba dokumenty sdílejí styl (`preamble.tex`):

```sh
make              # vytvoří obě PDF (ai-rules + motivace)
make ai-rules.pdf # jen hlavní dokument
make motivace.pdf # jen doprovodný text
make clean        # úklid pomocných souborů
```

Detaily sazby a struktury: [README_TEX.md](README_TEX.md).

## Vydávání

PDF se publikuje automaticky při git tagu `vX.Y.Z` do větve `releases`,
která drží stabilní odkaz na poslední vydání. Nastavení CI/CD a release
procesu: [README_CI.md](README_CI.md).

## Přispívání

Připomínky, oponentura a zkušenosti z praxe jsou vítané — rámec vznikl
z praxe a praxí se zpřesňuje. Viz [CONTRIBUTING.md](CONTRIBUTING.md).

## Licence

[CC-BY 4.0](LICENSE) — volné použití včetně komerčního, jedinou podmínkou
je uvedení autora.
