# Dostupnost kontextu (ne jen jeho dokumentace)

**Status:** draft / k rozpracování
**Vztah k rámci:** kandidát na rozšíření osy *mentální model* (sekce Východisko)

## Teze

Rámec dnes říká, že AI nezná *nezdokumentovaný* kontext. Ostřejší řez ale nevede
mezi *zdokumentovaným* a *nezdokumentovaným*, nýbrž mezi **dostupným** a
**nedostupným** — tím, co AI fakticky má v kontextovém okně, a tím, co ne.

Spousta kontextu je zdokumentovaná dokonale, jen mimo dosah modelu. Rozhoduje
dostupnost, ne kvalita dokumentace.

> „Je to zdokumentované" ≠ „AI to ví."

## Kde nedostupný kontext leží

- **Analogový svět** — čmáranice z prototypování, náčrt na tabuli, podepsaná
  smlouva v šuplíku právního.
- **Jiný digitální systém** — Confluence, ticketing, e-mailová vlákna, repozitář,
  ke kterému AI nemá přístup.
- **V lidech** — nepsané procesy, zkušenost („tohle už jsme zkoušeli"),
  historické důvody („proč je to postavené takhle").

Confluence stránka *je* dokumentace. Smlouva *je* dokumentace. Pro AI jsou ale
stejně neviditelné jako nikdy nezapsaná znalost, dokud je někdo vědomě nepřenese
do kontextu.

## Důsledek (pokud se to dotáhne do rámce)

Přenos kontextu do AI je **vědomý úkon vývojáře**, ne vlastnost prostředí.
Z toho plyne možné opatření: před delegováním úkolu explicitně ověřit, jaký
nedostupný kontext se daného místa týká a zda je potřeba ho do kontextu doplnit.

## Otevřené otázky

- Je to samostatná osa, nebo jen rozšíření *mentálního modelu*?
- Pokud osa: musí se promítnout i do tabulky ve Východisku a do motivace —
  jinak vznikne nekonzistence (jeden bod mluví o dostupnosti, zbytek o dokumentaci).
- Stojí za samostatné opatření v sekci pravidel, nebo zůstává na úrovni principu?
