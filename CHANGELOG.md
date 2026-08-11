# Changelog

All notable changes to **type** are listed here, newest first. Each release
section becomes the body of the matching GitHub Release, which the in-app
auto-updater and kellyvohs.com/type both read from.

---

## v1.16.0

### Changed
- **The whole bottom row fades in together.** The days dots, keep, kept, burn, settings, and share used to arrive at slightly different moments; now they're one row on one timing, appearing and bowing out as a set.
- **Share moved down to the bottom-right,** next to settings, instead of sitting alone up top.

### Improved
- **Zen mode now clears the surface completely.** On top of going fullscreen, it fades away every control, so there's nothing on the page but your words. Toggle it with ⌘⇧Z (Esc to exit).

## v1.15.4

### Changed
- **The bottom bar reads as one row.** Keep, kept, and burn now sit at the same weight as the days and settings glyphs, and the dividers between the words are quiet dots instead of pipes.

## v1.15.3

### Fixed
- **The days and settings glyphs at the bottom are easier to read.** Their thin dots and strokes were drawn in the same pale grey as the KEEP and BURN labels, which left them faint and hard to make out. They now carry a little more weight.

## v1.15.2

### Changed
- **The days grid and settings moved down to the bottom bar.** The nine-dot days opener now sits at the bottom-left and settings at the bottom-right, in line with keep and burn, instead of up in the top corners. They fade in with the bottom bar too, so nothing arrives ahead of it.

### Fixed
- **The rail no longer shows days you never wrote.** An early demo build left months of invented dots in the record. Those are gone, and the rail now rebuilds itself from your real kept notes.

## v1.15.1

### Improved
- **Your writing days read like the rest of the app.** Each month in the rail is now a titled section with the same spacing and weight as the panels in settings, instead of its own small-caps style.

### Fixed
- **The rail no longer fades out at the bottom.** The soft fade that sits at the foot of the page was still being drawn over the record, so the last month trailed off into nothing.

## v1.15.0

### Changed
- **The days you've written moved off the page and into a rail.** Last release put a row of dots under the bottom bar; a fresh install showed a single dot floating there, which looked like a mistake rather than a record. The dots now live behind a small grid of nine dots in the top-left corner: click it and the page slides aside to show every month you've written, a dot a day, back to the first day you wrote. Still no number and nothing to break. Share moved to the top-right, next to settings, since the left corner belongs to the rail now.

---

## v1.14.0

### New
- **The days you've written, under the bottom bar.** A row of small dots, one for each of the last four weeks of days. A filled dot means you wrote that day — keeping and burning both count, since burning a page is still writing — and today wears a ring. There is no number, and nothing to break: it's a shape, not a score. The row fades with the rest of the bar the moment you start typing, and it grows from the first day you write, so it begins as a single dot rather than a month of empty ones. Turn it off under Display → Days written. To draw it, type now remembers the dates you wrote, which it never did before: dates only, on your Mac, and nothing about what you wrote.

---

## v1.13.1

### Fixed
- **Future updates download only what changed.** Starting with this release, type publishes the map its updater needs to compare one version with the next. It no longer has to download the whole app whenever only a small part changed.

---

## v1.13.0

### Improved
- **The typewriter font is in the app now.** Courier Prime was being fetched from Google every time type opened, so the one typeface the whole app is built around needed a working connection to show up, and offline you got whatever your Mac substituted. It ships inside type now. Nothing to load, nothing to wait for, and no request leaves your machine to draw a letter.
- **Feedback goes to the studio.** Sending a note from inside type used to route through a separate service and land in a personal inbox. It now goes straight to WatchCap Studio.

### Fixed
- **type counts people, and remembers nobody.** type has always recorded only that someone wrote, never a word of what. But it used to attach a number that stayed the same forever, which meant the record could be followed around. It now sends something that changes every day, every week and every month, so the only question the data can answer is how many people wrote. Because there is nothing left to switch off, the Anonymous usage setting is gone.

---

## v1.12.2

### Fixed
- **The line always turns at the margin.** Certain text — pasted from another app, or touched by a spell-check correction — carried invisible non-breaking spaces, and a line made of them would run off the right edge of the page forever instead of wrapping. Those spaces are now converted to ordinary ones as you write, and even a line with nowhere to break turns at the margin like a typewriter hitting the end of the carriage.
- **Return puts you back on the writing line.** Pressing Return after a long paragraph used to land the cursor below the middle of the page, and each long paragraph pushed your writing further toward the bottom. The page now rolls by exactly the height of what you wrote, so the cursor comes back to the same writing line every time.
- **Long paragraphs keep their words whole.** A paragraph that wrapped past the margin could re-break mid-word when it settled onto the page — "window" split into "windo" and "w", a quote mark stranded at the start of a line. Committed text now wraps at spaces, the same places it wrapped while you typed it.

---

## v1.12.1

### Fixed
- **A keep that fails now says so.** If the file could not be written, type used to eject the page, ring the bell and stamp it kept anyway, so a lost page looked exactly like a saved one. Now the page stays on screen, your draft stays put, and the stamp reads NOT SAVED until you touch the keyboard again.
- **Kept pages are dated in your own time.** Filenames and the date in the frontmatter were written in UTC, so a page kept in the evening was dated tomorrow and reached your journal under the wrong day.

---

## v1.12.0

### New
- **Spelling help, at last.** Misspelled words get the familiar red dotted underline, and a right-click now offers corrections, along with Learn Spelling and the usual cut, copy, and paste. The Spell check switch in settings turns the whole thing on or off.
- **Spell check on iPhone too.** With Autocorrect on, the phone now underlines misspellings as you write. Tap a marked word to pick a replacement.

---

## v1.11.3

### Fixed
- **Highlighting with the mouse is under control again.** On the editable page, dragging to select a few lines could run away: the page scrolled out from under the pointer and the highlight raced to the end of the note. Selection now follows the mouse and stops where you stop. Typing is unchanged, and the writing line still holds its place at the middle of the page.

---

## v1.11.2

### Fixed
- **⌘⌫ clears to the start of the line.** Holding Command and pressing Delete now works the way it does everywhere else on the Mac — it removes everything from the cursor back to the beginning of the line and leaves anything to the right of the cursor alone. Before, it wiped the whole line no matter where the cursor sat; on the editable page it did nothing at all.

---

## v1.11.1

### Fixed
- **Back from kept, ready to type.** Pressing Esc to leave the kept browser now drops you back on the page with the cursor already blinking — just start writing, no click needed first.

---

## v1.11.0

### Changed
- **Even spacing, top to bottom.** The line you're writing now breathes exactly like every line above it. No more tightening on the current line, and no little jump when you press Return — your spacing choice (tight / normal / loose / wide) applies to the whole sheet, uniformly. The cursor stays small, sized to the letters rather than the spacing, at every setting. (Under the hood: type now paints its own cursor, the way a native editor does, instead of taking the browser's — which is glued to the line height.)

### Fixed
- **The editable page opens every time.** With the editable page turned on, skipping the opening animation could leave you on a locked sheet you couldn't change. Now editable is editable no matter how you get to the page.
- **The editable page keeps your cursor where you're writing.** On Mac the writing line now rests at the middle of the page — the same height as the typewriter page — and the text scrolls up beneath it as you go, instead of drifting down toward the bottom.

---

## v1.10.0

### New
- **iCloud sync, on by default.** Your writing saves to a “type” folder in iCloud Drive and syncs across your devices — privately. type has no server, so your pages are never seen by anyone but you. On first launch you choose: sync with iCloud, or pick your own folder (an Obsidian vault, Dropbox, anywhere). A single iCloud-sync switch lets you save somewhere else for a while and return to your type folder in one tap.
- **Settings, as a side rail.** Opening settings now slides the page aside to reveal a full-height panel, the way the iPhone app does. Everything’s grouped — Saving, Writing, Display, Sound — with theme and line spacing pinned at the bottom.
- **Browse your kept pages.** A quiet **kept** sits between KEEP and BURN (or press ⌘⇧K): it opens everything you’ve saved as a roll of paper sheets you can scroll, arrow through, and open to read.
- **A cleaner bottom bar.** KEEP · KEPT · BURN are plain words now; hover any of them for its shortcut. Settings moved to a small menu in the top-right corner, and share to the top-left.

### Changed
- Themes are **day / night / amber / dispatch**; line spacing is **tight / normal / loose / wide**.

---

## v1.9.0

### New
- **Undo, redo, and real selection.** The writing line is now built on macOS's own text engine, so ⌘Z undoes, ⌘⇧Z redoes, and you can select, copy, and paste like in any native field — dictation works too. The typewriter feel is unchanged: committed lines still lock, and the block cursor still rides the strike line. But the text underneath is solid now, so the occasional doubled cursor and dropped/scrambled characters are gone.
- **Line spacing.** A new tight / normal / air control in settings sets how much room each line gets — a dense draft or a wide, airy page.
- **Autocorrect.** A settings toggle, off by default so the typewriter stays literal. Turn it on to let macOS fix spelling as you write.
- **Your kept pages, in the app.** The review drawer reads the real `.md` files in your save folder, so you can browse, search, and reopen what you've written. Share a kept page to the system share sheet, or click the folder name in settings to open it in Finder.

---

## v1.8.0

### New
- **⌘⇧B — report with a screenshot.** The same shortcut the Dispatch work board uses: it captures the page exactly as it looks (just the window, no screen-recording permission), opens the feedback sheet with the shot attached, and the report lands with the screenshot included. Plain ⌘B still burns — the shift makes all the difference.

---

## v1.7.0

### New
- **Paste works.** ⌘V types the clipboard onto the page. On the writing line it flows through the same wrap as typing, so a long passage lands exactly as if you'd typed it — including line breaks. With the cursor up on an earlier line (editable page on), it pastes right at the cursor; the line still stops at the margin. On a locked page, the past stays locked — paste up there takes no ink, just like typing. Pasted text keeps its spacing as written: the double-space-makes-a-period trick only applies to your own keystrokes.
- **Real text-navigation shortcuts when you arrow up.** Once the cursor is on an earlier line — editable page on or off — the macOS habits work: ⌥← / ⌥→ jump by word, ⌘← / ⌘→ (or Home / End) go to the ends of the line, ⌘↑ jumps to the first line, and ⌘↓ drops you straight back to the writing line.

---

## v1.6.0

### New
- **Editable page.** A new switch in settings unlocks the page: the arrow keys move the cursor back through everything you've written, and you can edit it like a normal document — insert, delete, fix the typo three lines up. The paper rolls back down so the line you're editing sits right at the strike point. It's a decision you make before you write: once there's ink on the page the switch dims and stays put until the next sheet, so you can't bail out of a locked page halfway through. Off by default — the typewriter is still the typewriter.

---

## v1.5.2

### Fixed
- **Choosing a save folder works again with Stay on top on.** With "Stay on top" enabled, clicking **choose…** under "save as .md to" appeared to do nothing — the folder picker was opening *behind* the always-on-top window, hidden from view. The picker now attaches to the window itself, so it always comes up in front no matter what.

---

## v1.5.1

### Improved
- **Updates show a progress bar instead of a stack of dialogs.** When a new version is downloading, a quiet bar at the top of the page fills as it goes, so you can actually see how far along it is — no more clicking "Check for Updates" again to find out. When it's ready, a single **restart** appears: one click installs it and reopens right where you left off. Checking from the menu gives instant feedback too. And if you'd rather not stop, just ignore it — the update still installs on its own the next time you quit.

---

## v1.5.0

### Improved
- **Markdown lines read like the real thing.** A line that starts with `> `, `- ` / `* `, or `# ` now hides the literal marker as you write — a quote shows just its left rule, a list item gets a real • bullet, a heading simply goes bold. The markers still live in the file underneath, so your saved `.md` stays valid and byte-faithful; they're only tucked out of sight on screen. Wrapped list and heading lines keep their shape through resize and reload.
- **The pointer gets out of your way.** The mouse cursor now hides itself while you're typing, so it stops hovering in the middle of the page when you tab back from another app. Any nudge of the mouse brings it right back.

### Fixed
- **Editing a list, quote, or heading line from above works again.** Pressing ↑ to step back onto an earlier line and type over it used to break on any `- `, `> `, or `# ` line: the cursor landed on the now-hidden marker, became invisible, and keystrokes piled up on top of themselves — sometimes quietly mangling the line. The cursor now skips past the marker to the first real character, stays visible, and leaves the marker untouched.

---

## v1.4.2

### Fixed
- **Keeping a long page rolls it up, not down.** On a page taller than the window, ⌘S used to shove the sheet *downward* a moment before it vanished, instead of pulling it up and off the platen. The eject now lifts from wherever the page is scrolled to, so a kept page always rolls up and away like paper leaving a typewriter — and the date stamp lands on the clean platen behind it. Short pages behave exactly as before.

---

## v1.4.1

### Improved
- **Launch feels intentional.** The window now stays hidden until first paint is ready, then appears with the "type." wordmark animation running from the top. No more white flash, no more catching the intro mid-animation — the window opening *is* the wordmark reveal.
- **Window dragging in small sizes.** Added an invisible drag region along the top of the window so you can always grab and move it, even at narrow widths where there's no chrome to grab onto.

### Fixed
- **No more mid-word splits on resize.** A word like "how" used to occasionally render as "ho / w" when the window was sized just-so. The CSS now only breaks mid-word as a last resort, and the column math has a touch more headroom so the JS-wrapped lines reliably fit the visual container.
- **Seeded opening quotes re-center on resize.** Previously only your own typing reflowed when you resized the window; the quote on launch stayed at its original wrap, drifting left when the window grew. The quote now reflows with you, preserving body / attribution styling.

---

## v1.4.0

### New
- **Markdown styling.** Lines starting with `> `, `- ` / `* `, or `# ` get gentle visual treatment — italic block quotes with a left rule, hanging-indent bullets, bolder headings. Strictly line-level: `**bold**` and `_italic_` inside a line don't render, so the typewriter grid stays intact and your `.md` export is byte-identical to what you typed.
- **Pages counter.** New toggle in settings alongside word count and timer. 250 words per page — the manuscript / morning-pages convention.

### Improved
- **Resize keeps the page centered.** When you stretch the window, committed lines re-wrap to the new width so your writing stays centered instead of stranded against the left edge. Blank-line paragraph breaks are preserved.
- **Save animation.** The page now pulls off the platen with a "pull then rip" curve — gentle engagement, then a fast finish. The date stamp lands on a clean empty platen instead of fading in over the lifting page.
- **Burn animation.** Smoke puffs removed. Characters fade in place (no per-char jitter). Sparks redesigned to feel like real campfire embers — fire-orange across every theme, glide along curved paths instead of going straight, spawn from across the burning text, with a couple of lingerers that hang on after the rest fade.

### Fixed
- `⌥⌫` (delete previous word) now keeps the space before the deleted word. It used to eat the space too.

---

## v1.3.9 and earlier

See the [GitHub Releases page](https://github.com/kvohs/type/releases) for older release notes.
