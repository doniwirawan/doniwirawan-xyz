-- Blog post: "How a Balinese Script Translator Actually Works"
--
-- Search Console says people reach the site looking for a "balinese script
-- generator" and a "balinese script translator", land on nothing, and leave.
-- The existing Aksara Bali post is about why the tool exists; this one is about
-- what it does, which is what those searches are actually asking.
--
-- Written with an FAQ section at the end: /api/post turns "### " headings under
-- "## FAQ" into FAQPage structured data.

insert into public.posts (slug, title, excerpt, body, published, published_at)
values (
  'how-a-balinese-script-translator-works',
  'How a Balinese Script Translator Actually Works',
  'A Balinese script generator looks like one text box and a bit of magic. It is really a chain of small decisions about vowels, stacked consonants, and the sounds Latin cannot spell. Here is what happens between what you type and the aksara you get back.',
  $body$Short answer: it does not translate. It **transliterates**. A Balinese script translator swaps one writing system for another while the language stays exactly where it was. Type *bali* into [Aksara Bali](https://aksarabali.doniwirawan.xyz) and you get the word *bali* spelled in Balinese script — not a Balinese word meaning something else.

I built that converter, so I have spent an unreasonable amount of time in the gap between what people expect a Balinese script generator to do and what it can honestly do. This is that gap, written down.

## Aksara Bali is an abugida, not an alphabet

In the Latin alphabet every letter stands alone. `k` is `k`, `a` is `a`, and you line them up left to right.

Aksara Bali does not work like that. Each consonant letter already carries a vowel with it — an inherent *a*. The base letter is not "k", it is **ka**, finished, pronounceable on its own. To get *ki* you do not add a letter beside it; you hang a mark called **ulu** above it. For *ku*, a mark called **suku** goes underneath. For *ke* and *ko*, marks go in front, or in front and behind at once.

That is what an abugida is. It is also why a converter cannot be a lookup table. It has to work out what belongs to which syllable before it can draw anything at all.

## What happens between your text box and the script

Roughly four steps, in this order.

**It splits your text into syllables.** Not letters — syllables. *bali* is *ba* + *li*. *nglawang* is not n-g-l-a-w-a-n-g: the `ng` is one sound and one letter, and the `ng` on the end is not a letter at all but a mark called **cecek** that sits on top of the syllable before it.

**It picks the base letters.** One per syllable, each already carrying its *a*.

**It attaches the vowel signs.** *i* becomes ulu above, *u* becomes suku below, *o* wraps around both sides. The inherent *a* needs nothing at all — which is why *bali* comes out as two letters and one small mark, rather than four of anything.

**It handles the consonants with no vowel of their own.** This is the interesting one. In *sastra*, the `s` and the `t` collide with nothing between them. Aksara Bali does not leave a bare consonant sitting there mid-word: the second one goes *underneath* the first as a **gantungan**, or beside it as a **gempelan** — hanging or clinging, depending on the letter. Only at the end of a word does the script reach for **adeg-adeg**, the mark that simply cancels the inherent vowel.

Get that last step wrong and the output is still readable, but it is the kind of wrong a Balinese teacher spots in under a second.

## Where every converter has to guess

Three places. All three are failures of the Latin alphabet, not of the script.

### The letter `e`

Indonesian writes two different vowels with the same `e`. The *e* in *sate* and the *e* in *empat* are not the same sound, and in Aksara Bali they are not the same mark: one is **taling**, the other is **pepet**. The Latin spelling gives a converter no way to tell them apart.

So it guesses, from a dictionary and from patterns. On common words it is usually right. On your surname it is a coin flip. If your name has an `e` in it, that is the first character to check.

### `v` and `w`

There is no *v* in Aksara Bali. Sanskrit words that reach English with a *v* — Vishnu, Vedanta — are written with **wa**. That is why the converter treats `v` and `w` as the same letter, and why *Vishnu* and *Wisnu* come out identical. That one is not a guess. It is the correct answer.

### Sanskrit and Kawi spellings

Balinese has borrowed heavily from Sanskrit and Old Javanese, and borrowed words tend to keep their original spelling rather than being respelled the way they are said today. *Dharma* keeps letters that a purely phonetic transliteration would throw away.

There is no way to work this out from the letters alone — you have to know the word. The converter carries a database of a hundred-odd Sanskrit terms for exactly this reason, plus a mode switch: auto-detect, Sanskrit-only, or Balinese-only. If you are converting a mantra or a temple name, set it to Sanskrit and the guessing stops.

## What it is good for

Learning. Type your name, watch where the marks land, change one letter, watch what moves. That loop taught me the script far faster than a table of characters ever did, and it is the reason the tool exists at all. It is free, it runs entirely in your browser, and what you type is not sent anywhere. There is also an [offline Android app](https://play.google.com/store/apps/details?id=xyz.doniwirawan.aksara_bali_mobile) if you would rather practise without a connection.

Drafts, social posts, getting a feel for how a word sits on the page — all fine.

## What it is not good for

Anything permanent or ceremonial, without a person who knows the script checking it first. Tattoos. Temple inscriptions. Printed invitations. Anything going onto a wall.

Transliteration conventions vary by region and by scholar, and my converter picks one path through that. It is a learning tool, not an authority, and I would rather say so here than have someone find out the expensive way.

If you would rather read the practical version in Indonesian, it is here: [Cara Translate Latin ke Aksara Bali Online](/blog/cara-translate-latin-ke-aksara-bali). And the reason I built any of this is [in an older post](/blog/why-i-built-aksara-bali).

## FAQ

### Is a Balinese script translator the same as a translator?

No. It converts spelling, not meaning. Type an English sentence and you get that English sentence written in Balinese letters — unreadable to a Balinese speaker in a completely different way from the one you were hoping for.

### Do I need to install a font?

Not on the web tool: it ships the Balinese font with the page. Fonts start mattering when you paste the result somewhere else, because the receiving app has to have a Balinese font of its own. If you see empty boxes, [that is a font problem, not a text problem](/blog/aksara-bali-jadi-kotak-di-hp).

### Is it free?

Yes, and it will stay free. The converter needs no account, runs in your browser, and uploads nothing.

### Can it go the other way, Balinese back to Latin?

The Android app converts in both directions, and the web tool has an on-screen Balinese keyboard — split into aksara wianjana, pangangge and punctuation — if you want to compose in the script directly.

### Why does my name look different from what a friend wrote by hand?

Usually the `e`: pepet where you wanted taling, or the reverse. After that, a Sanskrit-derived name that wants its original spelling. Both are fixable by hand once you know which mark to look at.

### Is the output real text, or a picture?

Real text. It is Unicode, in the Balinese block, so it can be copied, searched and pasted like any other writing — which matters far more than it sounds.$body$,
  true,
  '2026-07-30T09:00:00+08:00'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-script-translator.svg'
where slug = 'how-a-balinese-script-translator-works';
