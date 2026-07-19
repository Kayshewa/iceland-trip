# DJ Money's Soundboard — sound credits & licenses

All audio in this app is either **original (procedurally generated)** or from a
**free, no-attribution-required** source. Nothing here requires attribution, but
sources are documented below for the record. Every clip is bundled locally in
`sounds/` — the app makes no external calls at runtime.

## Real recordings — Mixkit (Mixkit Free License: free, commercial use, no attribution)

Downloaded from https://mixkit.co/free-sound-effects/ and processed locally
(converted to mono 16-bit WAV, trimmed, loudness-matched):

| Button        | File            | Mixkit clip                              |
|---------------|-----------------|------------------------------------------|
| Magic Wand    | magic-wand.wav  | "Magic wand sparkle"                     |
| Laughter      | laughter.wav    | "Big crowd laughing" (trimmed)           |
| Dun Dun Dun   | dramatic.wav    | "Cinematic mystery trailer drum hit"     |
| Applause      | applause.wav    | "Medium size crowd applause" (trimmed)   |
| Cheer         | cheer.wav       | "Stadium joy shouting crowd" (trimmed)   |
| Correct!      | ding.wav        | "Quick positive video game notification" |
| Wrong!        | buzzer.wav      | "Trombone disappoint" (sad trombone)     |
| Drumroll      | drumroll.wav    | "Drum Roll" (trimmed)                     |
| Boing         | boing.wav       | "Boing hit sound"                        |
| Whoosh        | whoosh.wav      | "Fast whoosh transition"                 |
| Pop           | pop.wav         | "Long pop"                               |
| Ba-Dum-Tss    | rimshot.wav     | "Joke drums"                             |

Mixkit Free License: https://mixkit.co/license/#sfxFree — free to use in commercial
and non-commercial projects, no attribution required; do not resell/redistribute the
sound effects as standalone files or as a competing sound-effects library. Using them
as button sounds inside this classroom app is within the license.

## Original — procedurally generated (public domain / original work)

Synthesized from scratch (numpy) for this app; no license restrictions:

`crickets.wav`, `tada.wav` (Ta-Da!), `bell.wav` (Attention), `countdown.wav`,
`chime.wav` (Clean-Up), `cash-register.wav` (Ka-Ching), `order-up.wav` (Order Up!),
`timer.wav` (Timer's Up).

## Swapping a sound

To replace any preset, drop a new audio file into `sounds/` using the **same
filename** (the button config in `index.html` references it by name) and redeploy.
Teachers can also add their own sounds live via the "＋ Add a sound" buttons — those
are stored in the browser (IndexedDB) per device and need no code change.
