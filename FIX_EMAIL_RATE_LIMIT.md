# Fix: Email Rate Limit Exceeded Error

## Problem
You're seeing this error:
```
AuthApiException: email rate limit exceeded
statusCode: 429
code: over_email_send_rate_limit
```

This happens because Supabase is trying to send confirmation emails, but you've hit the rate limit.

## Solution: Disable Email Confirmation (For Development)

### Step 1: Go to Supabase Dashboard
1. Open https://supabase.com/dashboard
2. Select your project

### Step 2: Disable Email Confirmation
1. Click **"Authentication"** in the left sidebar
2. Click **"Settings"** (or go to Authentication → Settings)
3. Scroll down to **"Email Auth"** section
4. Find **"Enable email confirmations"** toggle
5. **Turn it OFF** (disable it)
6. Click **"Save"**

### Step 3: Alternative - Use Magic Link (Optional)
If you want to keep email confirmation but reduce rate limits:
1. In Authentication → Settings
2. Enable **"Magic Link"** instead
3. Users can sign in without password

---

## Quick Fix Steps:

```
Supabase Dashboard
├── Authentication
│   └── Settings
│       └── Email Auth
│           └── "Enable email confirmations" ← Turn OFF
│           └── Save
```

---

## After Fixing:

1. **Try signing up again** - should work immediately
2. Users can sign up without email confirmation
3. For production, you can re-enable it later

---

## Why This Happens:

- Supabase sends confirmation emails for each signup
- Free tier has rate limits (usually 3-4 emails per hour)
- During testing, you might hit this limit quickly
- Disabling confirmation bypasses this for development

---

## For Production Later:

When ready for production:
1. Re-enable email confirmation
2. Set up proper email templates
3. Consider upgrading Supabase plan for higher limits
4. Or use custom SMTP for unlimited emails

---

**That's it! Disable email confirmation and try again.** ✅
