# KRYONIX

Native SwiftUI starter for the private two-person KRYONIX app.

## Current starter screens
- Home: relationship day counter + Story strip
- Album: grid, detail view, favorite heart
- Chat: fixed composer and modern iOS icons
- Map: two-person social-map prototype with battery/status cards
- Us: cover, avatar, nickname and selectable profile effects

This starter intentionally uses demo/local data. Realtime pairing, chat, media storage,
story views and location sharing should be connected to a backend next.

## Build on GitHub from Windows

1. Create a GitHub repository.
2. Upload everything in this ZIP to the repository root.
3. Keep the default branch as `main`.
4. In GitHub: Settings -> Secrets and variables -> Actions.
5. Add these repository secrets:

- `BUILD_CERTIFICATE_BASE64`
- `P12_PASSWORD`
- `BUILD_PROVISION_PROFILE_BASE64`
- `KEYCHAIN_PASSWORD`
- `APPLE_TEAM_ID`
- `CODE_SIGN_IDENTITY`
- `EXPORT_METHOD`

Recommended `CODE_SIGN_IDENTITY` examples depend on your certificate, such as:
- Apple Development
- Apple Distribution

`EXPORT_METHOD` depends on the provisioning profile/distribution route, for example:
- development
- ad-hoc
- app-store-connect

The project currently uses bundle id:

`com.kryonix.app`

Your provisioning profile must match it. If your profile uses another Bundle ID,
edit `PRODUCT_BUNDLE_IDENTIFIER` in `project.yml` before building.

## Encode certificate/profile on Windows PowerShell

Certificate:

```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes("certificate.p12")) | Set-Clipboard
```

Provisioning profile:

```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes("profile.mobileprovision")) | Set-Clipboard
```

Paste each value into the matching GitHub secret.

## Run

GitHub -> Actions -> Build KRYONIX IPA -> Run workflow.

After a successful run, download the `KRYONIX-IPA` artifact.

## Updating from Windows

Edit source, then push:

```bash
git add .
git commit -m "Update KRYONIX"
git push
```

Every push to `main` triggers a new build.

## Online updates later

Chat, albums, stories, favorites, profiles and shared location should be server data,
so they can update without rebuilding the app. Native SwiftUI code changes still
require a new build/release.
