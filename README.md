# Claude Persona Pack

One-click, **session-scoped** personas for Claude. Pick a "hat" — a CFO-grade strategist, a security expert, a patient teacher, even a playful entertainer voice — and Claude takes it on for *that session only*. It never leaks into your other chats, and it never changes Claude's core: honesty, safety, and judgment stay exactly the same.

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

## Install (Claude Code / Cowork plugins)

From this folder's parent, add it as a local marketplace and install the plugin:

```shell
/plugin marketplace add ./Claude-Persona-Pack
/plugin install claude-persona-pack@persona-studio
```

Validate first if you like:

```shell
/plugin validate ./Claude-Persona-Pack
```

To publish for others, push this folder to a GitHub repo and have them run
`/plugin marketplace add <owner>/<repo>` then the same install command.

---

## Use a persona

Once installed, invoke a persona by name in any session, for example:

```
/claude-persona-pack:security-expert
```

or just ask in plain language: *"Put on the Data Scientist persona."*

To revert at any time, say **"drop the persona"** — Claude returns to default.

### The Persona Studio picker
Cowork can render an interactive picker (persona cards with a trait "mixing board"): tap a trait off to customize a persona before launching, then one click drops it into the current session. Ask Claude to "open the Persona Studio picker."

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

*Version 0.4.0*
