# How to Find Email Confirmation Settings in Supabase

## Method 1: Through Authentication → Providers

1. Go to **Supabase Dashboard**
2. Click **"Authentication"** in left sidebar
3. Click **"Providers"** tab (at the top)
4. Find **"Email"** provider
5. Click on **"Email"** to expand it
6. Look for **"Confirm email"** toggle
7. **Turn it OFF**
8. Click **"Save"** at the bottom

---

## Method 2: Through Authentication → Settings (if available)

1. Go to **Supabase Dashboard**
2. Click **"Authentication"** in left sidebar
3. Look for **"Settings"** tab (might be at the top with other tabs)
4. Scroll down to find **"Email Auth"** section
5. Find **"Enable email confirmations"** toggle
6. **Turn it OFF**
7. Click **"Save"**

---

## Method 3: Through Project Settings

1. Go to **Supabase Dashboard**
2. Click the **gear icon** (⚙️) at the bottom left (Project Settings)
3. Click **"Authentication"** in the settings menu
4. Look for **"Email Auth"** or **"Email Confirmation"** settings
5. **Disable email confirmation**
6. **Save**

---

## Method 4: Direct URL (if logged in)

Try this direct link (replace with your project):
```
https://supabase.com/dashboard/project/YOUR_PROJECT_ID/auth/providers
```

Or:
```
https://supabase.com/dashboard/project/YOUR_PROJECT_ID/auth/settings
```

---

## What to Look For:

The setting might be named:
- ✅ "Confirm email"
- ✅ "Enable email confirmations"
- ✅ "Require email confirmation"
- ✅ "Email confirmation required"
- ✅ "Confirm email" toggle switch

---

## Visual Guide - Most Common Location:

```
Supabase Dashboard
│
├── Authentication ← Click here
│   │
│   ├── [Providers] ← Click this tab (most common)
│   │   └── Email ← Click to expand
│   │       └── "Confirm email" ← Turn OFF
│   │
│   ├── [Settings] ← Or this tab (if available)
│   │   └── Email Auth section
│   │       └── "Enable email confirmations" ← Turn OFF
│   │
│   └── [Users] (other tabs)
```

---

## Alternative: Disable via SQL (Advanced)

If you can't find the UI setting, you can disable it via SQL:

1. Go to **SQL Editor**
2. Run this query:

```sql
-- Disable email confirmation (if using Supabase Auth)
UPDATE auth.config 
SET enable_signup = true, 
    enable_email_confirmations = false;
```

**Note:** This might not work on all Supabase versions. The UI method is preferred.

---

## Still Can't Find It?

1. **Check the top tabs** in Authentication page:
   - Providers
   - Users
   - Settings
   - Policies
   - Templates

2. **Look for "Email" provider** - Click on it to see its settings

3. **Take a screenshot** of your Authentication page and I can help locate it

4. **Alternative**: You can also wait 1 hour for the rate limit to reset, but disabling confirmation is better for development

---

**Most likely location: Authentication → Providers → Email → "Confirm email" toggle** ✅
