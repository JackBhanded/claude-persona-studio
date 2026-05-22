<div align="center">

<img src="assets/claude-logo.svg" width="64" alt="Claude" />

# Claude Persona Studio

**One-click, session-scoped personas for Claude — useful and fun.**

Pick a "hat" — a CEO-grade strategist, a security expert, a patient teacher, even a playful entertainer voice — and Claude takes it on for *that session only*. It never leaks into your other chats, and it never changes Claude's core: honesty, safety, and judgment stay exactly the same.

[![License: MIT](https://img.shields.io/badge/License-MIT-D97757.svg)](LICENSE)
[![Personas: 22](https://img.shields.io/badge/personas-22-D97757.svg)](#whats-included-22-personas)
[![Claude Code + Cowork](https://img.shields.io/badge/Claude%20Code%20%2B%20Cowork-3F8F77.svg)](#install--use)

</div>

---

**Always Claude inside.** A persona is a costume — it changes Claude's *voice and the expertise it foregrounds*, not what Claude is willing to do.

---

## What's included (22 personas)

**Technical experts**
- `data-scientist` — hypotheses, statistics, signal vs. noise
- `data-engineer` — reliable, idempotent, reproducible pipelines
- `security-expert` — threat models, hardening (defensive only)
- `software-engineer` — clean, tested, pragmatic code & reviews
- `ux-expert` — jobs-to-be-done, friction, accessibility

**Business & strategy**
- `ceo` — decisive strategy, trade-offs, clear calls
- `product-manager` — right problem first, ruthless prioritization
- `financial-planner` — money concepts & trade-offs (information, not financial advice)
- `marketer` — audience-first messaging and copy that converts
- `legal-savvy-reviewer` — contracts & risks in plain English (information, not legal advice)

**Knowledge & learning**
- `brainy-researcher` — citation-driven, confidence levels
- `ruthless-editor` — cuts, tightens, always shows the rewrite
- `astronomer` — accurate awe, honest about the unknown
- `patient-teacher` — meets you at your level, checks understanding

**Modes & mentors**
- `taskmaster` — demanding-but-caring accountability coach
- `devils-advocate` — stress-tests your idea, respectfully
- `zen-mentor` — clarity through questions and perspective
- `the-deductionist` — Sherlock-style reasoning (great for debugging)
- `negotiation-coach` — preps interests, BATNA, and the exact words

**Fun & famous (style-of homages, not impersonations)**
- `mad-scientist` — gleeful idea cannon for brainstorming
- `stage-showman` — joyful pop-showman energy (MJ-style homage)
- `nature-narrator` — documentary wonder for anything (Attenborough-style homage)

The style-of voices are affectionate impressions only: no fabricated quotes, no endorsements, no claims about the real people, and clearly labeled as homages.

---

## Install & use

Persona Studio is a Claude **plugin**, so it works in **Claude Code** and **Cowork** (which share the same plugin system). You install it **once** — it then works in *every* future session on those surfaces, no matter which folder you launch from. Plain web/desktop **chat** doesn't support plugins; see the workaround at the end.

### Step 1 — install it once (any Claude Code session)

Open Claude Code anywhere (the folder you start in doesn't matter — plugins install at the user level), then run these two slash commands in the prompt:

```text
# point Claude at this pack (use the local path now, or your GitHub repo after publishing)
/plugin marketplace add "C:\Users\Jack\Documents\Claude\Projects\Claude-Persona-Pack"

# install the plugin from it
/plugin install claude-persona-pack@persona-studio
```

After publishing to GitHub, others (and you, on another machine) use the repo instead:

```text
/plugin marketplace add JackBhanded/claude-persona-studio
/plugin install claude-persona-pack@persona-studio
```

That's it — the 22 personas are now registered for all your sessions.

### Step 2 — put a persona on (in any session)

Two ways, both work in Claude Code and Cowork:

```text
# explicit slash command (skills are namespaced as plugin:skill)
/claude-persona-pack:security-expert

# or just ask in plain language
Put on the Data Scientist persona.
```

Claude stays in that persona for the rest of the session. Say **"drop the persona"** to return to default.

### Which surface am I on?

- **Claude Code (terminal, launched from a folder):** do Step 1 once; then Step 2 in any session. Installing does **not** tie it to that folder — it's available everywhere.
- **Cowork:** because Cowork shares Claude's plugin config, installing once (above) makes the personas available here too. Just ask *"Put on the CEO persona"* (or open the picker, below).
- **Plain chat (claude.ai web / desktop app conversation):** plugins can't be installed here. Workaround: open the persona's `SKILL.md` (in `skills/<name>/`), copy its body, and paste it as your first message — or save it as a Claude Project custom instruction.

### The Persona Studio picker (Cowork)

Cowork can render an interactive picker — persona cards with a trait "mixing board" you can toggle before launching, then one click drops the persona into the current session. Just ask Claude to **"open the Persona Studio picker."**

> Tip: validate the pack before publishing with `claude plugin validate .` from this folder.

---

## How each persona is built

Every `SKILL.md` follows the same nine-part template so personas are consistent and easy to extend:

1. Identity & essence
2. Domain expertise (+ grounding rules where facts matter)
3. Voice & tone (the signature phrasings)
4. Reasoning framework / mental models
5. Behavioral rules
6. Never-do list
7. Trait diff vs. default Claude (what's dialed up / down)
8. Guardrails — always Claude inside
9. Sample exchange + exit clause

To add your own: copy any persona folder under `skills/`, rename it, and edit the nine sections. Bump the `version` in both `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json` on each release.

---

## Contributing — add your own persona

New personas are welcome. Each one is a single `SKILL.md` file in its own folder under `skills/`.

### Steps

1. Create a folder `skills/<your-persona-name>/` (kebab-case, no spaces).
2. Add a `SKILL.md` using the template below.
3. Fill in all nine sections — especially **Voice & tone** (the most important) and **Guardrails** (never optional).
4. Bump the `version` in both `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`.
5. Validate: `claude plugin validate .`
6. Commit and push (see `PUBLISH.md`).

### Template

```markdown
---
name: your-persona-name
description: Adopt the <Name> persona — <one-line essence>. Use for <when>. Invoke when the user asks for the "<Name>," "<alias>," or <trigger>.
---

# Persona: <Name>

## 1. Identity & essence
<Who this is and the single thing they optimize for.>

## 2. Domain expertise
<Knowledge to foreground; grounding rules if facts matter.>

## 3. Voice & tone
<Register, sentence length, vocabulary, 3-5 signature phrasings.>

## 4. Framework
<How this persona reasons / its mental models.>

## 5. Behavioral rules
<What it prioritizes; how it opens and closes; default format.>

## 6. Never-do list
<Persona-specific anti-patterns.>

## 7. Trait diff vs. default Claude
Dial **up**: <traits>. Dial **down**: <traits>.

## 8. Guardrails — always Claude inside
<The persona is a surface overlay; Claude's safety, honesty, and judgment never change. Add any persona-specific safety notes here.>

## 9. Sample & exit
<One short in-voice exchange. End with: "drop the persona" reverts to default Claude.>
```

### House rules

- **Always Claude inside.** A persona changes voice and foregrounded expertise — never what Claude is willing to do. Section 8 is required.
- **Style-of real people** must be affectionate homages: no fabricated quotes, no endorsements, no claims about their real lives, and label them `style-of`.
- **Advice domains** (legal, financial, medical) must explain options and trade-offs, avoid confident individualized recommendations, and remind the user to consult a licensed professional.
- **Defensive only** for security-style personas — no exploits or malicious tooling.
- Keep names kebab-case so they namespace cleanly (`/claude-persona-pack:<name>`).

---

## Part of a little fleet

Persona Studio is one of a set of open tools for people who build with Claude:

- **[Claude Meter](https://github.com/JackBhanded/claude-meter)** — live usage on your taskbar.
- **[Claude Lifeboat](https://github.com/JackBhanded/claude-lifeboat)** — backup & restore for your Claude data.
- **[Claude Lifejacket](https://github.com/JackBhanded/claude-lifejacket)** — keep every session aware of your projects.
- **[Claude Compass](https://github.com/JackBhanded/claude-compass)** — keep every session attuned to *you* (your working style).
- **[Claude Parachute](https://github.com/JackBhanded/claude-parachute)** — a safety net for the Bash changes Claude Code's `/rewind` can't see.
- **Claude Persona Studio** — give Claude a hat for the session. *(you are here)*

## About the author

<table>
<tr>
<td width="120" valign="top">
<img src="https://www.SawYouAtSinai.com/_layouts/images/team/jackbio.jpg" width="100" alt="Jack Bhanded">
</td>
<td valign="top">

Built by **[Jack Bhanded](https://www.sawyouatsinai.com/jewish-dating-team.aspx)**, Lead developer and architect at [SawYouAtSinai](https://www.sawyouatsinai.com). Devotee of innovative technologies and gadgets. Built this because he kept re-typing the same "act like a senior X, be concise" setup prompt to every fresh Claude session — so he turned the good ones into one-click personas.

</td>
</tr>
</table>

## License

[MIT](LICENSE) © Jack Bhanded — do whatever you want, just keep the copyright notice.

---

*Version 0.4.0*
