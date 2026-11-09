# aspace-herdr-app-adapter

Adapter A'Space pour `herdr-app` (client GPUI natif de herdr-core) — gel `b1a2a67`.

**Contrat seul** (§1.5) : aucune couture spécifique. La surface exposée est
la CLI amont, sous-commandes qui parlent seulement (AGENTS.md amont) :

- `herdr-app --help`, `herdr-app --skill` (imprime `src/SKILL.md`),
  `herdr-app --version`, `herdr-app check <mod>`, `herdr-app types <mod>`.

**Jamais** : lancer la fenêtre sans `HERDR_APP_HOME` scratch, tout envoi
télémétrie, tout appel réseau.

**Télémétrie** : module `src/telemetry.rs` — rapport anonyme 1/jour,
ON par défaut, coupé par `DO_NOT_TRACK` / `HERDR_TELEMETRY=0` / CI ;
seuls les builds release (`HERDR_APP_RELEASE`) envoient. L'adapter force
`DO_NOT_TRACK=1` + `HERDR_TELEMETRY=0` et ne construit que du debug
(voir `herdr-app-TELEMETRY-AUDIT.md`).

Smoke test : `bash aspace-herdr-app-adapter/smoke_test.sh`
(binaire debug requis : `cargo test --locked` d'abord).
