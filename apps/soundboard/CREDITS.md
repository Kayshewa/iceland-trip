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
| Magic Wand    | magic-wand.wav  | "Fairy magic sparkle"                    |
| Applause      | applause.wav    | "Medium size crowd applause" (trimmed)   |
| Wrong!        | buzzer.wav      | "Trombone disappoint" (sad trombone)     |
| Drumroll      | drumroll.wav    | "Drum Roll" (trimmed)                     |
| Pop           | pop.wav         | "Long pop"                               |

Mixkit Free License: https://mixkit.co/license/#sfxFree — free to use in commercial
and non-commercial projects, no attribution required; do not resell/redistribute the
sound effects as standalone files or as a competing sound-effects library. Using them
as button sounds inside this classroom app is within the license.

## Teacher-provided (supplied by the classroom owner, 2026-07-19)

Downloaded by the teacher and imported (converted to mono 16-bit WAV, loudness-matched).
Original source/license of these is the teacher's responsibility — used here for their
own classroom:

| Button      | File          | Original download filename                 |
|-------------|---------------|--------------------------------------------|
| Dun Dun Dun | dramatic.wav  | dun-dun-dun-sound-effect-brass_8nFBccR.mp3 |
| Cheer       | cheer.wav     | kids_cheering.mp3                          |
| Correct!    | ding.wav      | correct.mp3                                |
| Laughter    | laughter.wav  | laugh-track-2-mp3cut.mp3                   |
| Ba-Dum-Tss  | rimshot.wav   | ba-dum-tss_6.mp3                           |

## Original — procedurally generated (public domain / original work)

Synthesized from scratch (numpy) for this app; no license restrictions:

`crickets.wav`, `tada.wav` (Ta-Da!), `bell.wav` (Attention), `countdown.wav`,
`chime.wav` (Clean-Up), `cash-register.wav` (Ka-Ching), `order-up.wav` (Order Up!),
`timer.wav` (Timer's Up).

(Boing and Whoosh were removed at the teacher's request.)

## Swapping a sound

To replace any preset, drop a new audio file into `sounds/` using the **same
filename** (the button config in `index.html` references it by name) and redeploy.
Teachers can also add their own sounds live via the "＋ Add a sound" buttons — those
are stored in the browser (IndexedDB) per device and need no code change.
