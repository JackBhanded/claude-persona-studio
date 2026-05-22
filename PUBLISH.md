# Publishing the Persona Pack

This folder is a complete Claude plugin marketplace. To share it, host it on GitHub and have people install it with two commands.

## 1. Validate first

From inside this folder:

```
claude plugin validate .
```

Fix anything it reports before publishing.

## 2. Create a GitHub repo

Make a new **public** repo named `claude-persona-studio` (matches the rest of your fleet's `claude-*` naming). Don't add a README/license on GitHub's side — this folder already has them.

> Important: this folder must become the **repo root**, so that `.claude-plugin/marketplace.json` sits at the top level of the repo. The commands below do that.

## 3. Push it

Run these from inside this folder. Replace `<you>` with your GitHub username.

```
git init
git add .
git commit -m "Persona Studio v0.4.0 — 22 personas"
git branch -M main
git remote add origin https://github.com/<you>/claude-persona-studio.git
git push -u origin main
```

On Windows, just run the script — no arguments, it uses your cached GitHub login (create the empty repo on github.com first; see the script's header):

```powershell
powershell -ExecutionPolicy Bypass -File .\push-to-github.ps1
```

(`publish.bat` does the same from classic cmd.) The script also tags the `v0.4.0` release and pushes the tag.

## 4. Share the install commands

Anyone with the repo can run:

```
/plugin marketplace add <you>/claude-persona-studio
/plugin install claude-persona-pack@persona-studio
```

Then invoke any persona, e.g. `/claude-persona-pack:security-expert`, or just say "Put on the Data Scientist persona."

## Gotchas

- **Add by repo, not by raw URL.** The plugin `source` is a relative path (`./`), which only resolves when the marketplace is added via Git (`<you>/claude-persona-studio`). A direct link to `marketplace.json` would download only that file and miss the personas.
- **Bump the version on every release.** Both `.claude-plugin/plugin.json` and the marketplace entry pin `version`. Existing users only receive updates when that string changes. (Or delete the `version` fields to let each commit count as a new version automatically.)
- **Public vs private.** Private repos work too, but installers must be authenticated to your Git provider.

## Updating later

After editing personas:

```
git add .
git commit -m "Update personas"
git push
```

Users refresh with `/plugin marketplace update persona-studio`.
