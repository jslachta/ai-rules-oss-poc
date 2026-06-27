# Pravidla pro AI-asistovaný vývoj

Rámec pro řízení rizik při vývoji softwaru s asistencí AI — a vlastně
i bez ní. Šablona k převzetí a úpravě, ne hotová firemní směrnice.

**[➜ Stáhnout aktuální PDF](../../-/raw/releases/ai-dev-rules.pdf)**
*(odkaz funguje po prvním vydání; viz [Vydávání](#vydávání))*

Doprovodný text **[Proč tato pravidla](../../-/raw/releases/ai-dev-rules-motivace.pdf)**
shrnuje motivaci za rámcem — z čeho vyrostl a proč na tom záleží.
Kratší, esejistický; dobrý začátek, než se pustíte do pravidel samotných.

## O co jde

Většina debat o AI ve vývoji se ptá „smí AI psát produkční kód?“.
To je špatná otázka. Lepší je: jak velkou škodu chyba způsobí, jak
rychle ji poznáme a jak snadno ji vrátíme. Tyto otázky platily dávno
před AI — AI je jen nezmění, pouze zrychluje produkci kódu včetně
toho rizikového.

Rámec stojí na několika myšlenkách:

- **Riziko měříme na třech osách** — dosah škody (blast radius),
  ověřitelnost (jak rychle chybu poznáme) a reverzibilita (jak snadno
  ji vrátíme). Velký dopad, který je vratný, je zvládnutelný; malý
  dopad, který je nevratný, nemusí být.
- **Převzetí kódu jako vlastního** — otázkou není, zda kód napsala AI,
  ale zda mu vývojář rozumí, umí ho obhájit a doložit. Co tuto laťku
  splní, smí i do rizikových oblastí; co ne, nesmí nikam.
- **Zavedené vs nové projekty** — pravidla se liší podle toho, zda už
  existuje kódová báze s historií, nebo se hranice teprve staví.
- **Hranice se dají navrhnout** — dobrá architektura zmenší rizikové
  jádro tak, že většina kódu spadne do nízkorizikové zóny, kde může
  AI pracovat téměř bez omezení.

Dokument má dvě části: **závaznou směrnici** (část A) a
**best practices** (část B).

## Pro koho

Pro vývojové týmy, které chtějí AI používat uvážlivě — ani zákaz,
ani bezhlavé nasazení. Vezměte si, co sedí vaší organizaci; zbytek
upravte nebo vypusťte. Místa jako eskalační autorita jsou záměrně
obecná, doplňte je podle své struktury.

## Build

Zdroj je v LaTeXu (XeLaTeX). PDF se needituje ručně, generuje se ze
zdroje. Dva dokumenty sdílejí styl (`preamble.tex`):

```sh
make              # vytvoří obě PDF (ai-rules + motivace)
make ai-rules.pdf # jen hlavní dokument
make motivace.pdf # jen doprovodný text
make clean        # úklid pomocných souborů
```

Detaily sazby a struktury: [README_TEX.md](README_TEX.md).

## Vydávání

PDF se publikuje automaticky při git tagu `vX.Y.Z` do větve
`releases` jako stabilní odkaz. Nastavení CI/CD a release procesu:
[README_CI.md](README_CI.md).

## Přispívání

Připomínky, oponentura a vlastní zkušenosti jsou vítané — rámec
vznikl z praxe a praxí se zlepšuje. Viz [CONTRIBUTING.md](CONTRIBUTING.md).

## Licence

[CC-BY 4.0](LICENSE) — volné použití včetně komerčního, jedinou
podmínkou je uvedení autora. Vezměte to, upravte, nasaďte; jen
nechte vědět, odkud to je.
