# CI/CD — nastavení a workflow

Pipeline je v `.gitlab-ci.yml`. Tento soubor popisuje, co je třeba
nastavit **ručně v GitLabu** (z YAMLu to nevyplyne) a jak se vydává.

## Co dělá pipeline

| Spouštěč | Co se stane | Kam |
|----------|-------------|-----|
| Merge request | Build PDF, ověření kompilace | PDF + JSON jako **artifact** (30 dní), do gitu nic |
| Git tag `vX.Y.Z` | Build + publikace | `ai-dev-rules.pdf` (přepisovaný) do větve **`releases`** |

Publikuje se **jeden soubor `ai-dev-rules.pdf` bez verze v názvu** —
přepisuje se při každém tagu, takže URL na něj je stabilní **permalink**.
Verze žije *uvnitř* PDF (patička + titulka) a v `ai-dev-rules.json`;
historii vydání drží `index.md` ve větvi `releases`.

Hlavní větev (`main`) je **čistě zdroj** — žádné PDF. Výstupy žijí
v oddělené větvi `releases` (model jako `gh-pages`).

## Ruční nastavení (jednorázově)

### 1. Project Access Token pro push do `releases`

CI commituje do větve `releases`, k tomu potřebuje token s právem zápisu.

1. **Settings → Access Tokens** → vytvoř token:
   - role **Maintainer**, scope **`write_repository`**
2. Zkopíruj hodnotu (zobrazí se jednou).
3. **Settings → CI/CD → Variables** → přidej:
   - klíč `GIT_PUSH_TOKEN`, hodnota = token
   - **Masked** ✔, **Protected** ✔ (jen na chráněných tagech/větvích)

> Bez tohoto tokenu release job selže na `git push`. CI_JOB_TOKEN
> standardně nemá právo pushovat do repozitáře, proto vlastní token.

### 2. Povinný merge request + squash

- **Settings → Merge requests:**
  - **Squash commits when merging: Require** (vynutí squash)
- **Settings → Repository → Protected branches:**
  - `main`: **Allowed to push: No one** (vynutí cestu přes MR)
  - **Allowed to merge:** dle vašich rolí
- **Settings → Repository → Protected tags:**
  - vzor `v*` — chrání tagy, aby vydávat mohl jen oprávněný

### 3. (Volitelně) Branch protection pro `releases`

Větev `releases` je strojová. Doporučeno:
- **Allowed to push:** nikdo ručně (jen CI přes token)
- nezahrnovat do běžných MR

## Jak vydat novou verzi

```sh
# 1. změny jsou v main (přes MR, squash)
git checkout main && git pull

# 2. vytvoř SemVer tag
git tag -a v1.2.0 -m "Pravidla pro AI vývoj — v1.2.0"
git push origin v1.2.0
```

Tag spustí `release:publish`: PDF se zkompiluje s vraženou verzí
(`v1.2.0`, commit, datum) do patičky i titulky a uloží se do větve
`releases` jako `ai-dev-rules.pdf` (přepíše předchozí). Vznikne i
`ai-dev-rules.json` s metadaty a přibude řádek do `index.md`.

Stabilní odkaz (permalink) na poslední vydání:

```
https://<gitlab-host>/<skupina>/<projekt>/-/raw/releases/ai-dev-rules.pdf
```

## Publikace na externí share

Závěr release jobu má **placeholder** pro nahrání na share
(SMB / SCP / S3). Doplň podle zvoleného úložiště a přidej potřebné
přihlašovací CI proměnné (maskované).

## Verze v PDF — lokální vs CI

- **Lokálně** (`make`): `version.tex` neexistuje → fallback `vdraft (local)`.
- **V CI:** pipeline vygeneruje `version.tex` z tagu/commitu/data.
- `version.tex` je v `.gitignore` — nikdy se necommituje.

## Náklady

Build běží **jen na MR a na tag**, ne na každý push do `main`.
Pokud i to bude moc, lze `build:mr` omezit pravidlem `changes: ["*.tex"]`,
aby se PDF nebuildilo při změně mimo .tex soubory.
