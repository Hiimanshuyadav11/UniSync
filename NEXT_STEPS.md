# Next Steps After Database Setup ✅

## Step 1: Install Dependencies

Open your terminal in the project folder and run:

```bash
cd unisync
flutter pub get
```

This will install all required packages including Supabase.

---

## Step 2: Add Sample Data (Optional but Recommended)

Go to Supabase SQL Editor and run these to add test data:

### Add a Sample Event:

```sql
INSERT INTO events (title, description, event_date, start_time, end_time, location)
VALUES 
  ('Welcome to UniSync', 'Join us for the official launch of UniSync platform', CURRENT_DATE + INTERVAL '3 days', '10:00:00', '12:00:00', 'Main Auditorium'),
  ('Tech Workshop', 'Learn about modern web development', CURRENT_DATE + INTERVAL '5 days', '14:00:00', '16:00:00', 'Computer Lab'),
  ('Campus Tour', 'Explore the campus facilities', CURRENT_DATE + INTERVAL '7 days', '09:00:00', '11:00:00', 'Main Gate');
```

### Add Sample Announcements:

```sql
INSERT INTO announcements (title, description, category)
VALUES 
  ('Library Maintenance', 'The library will be closed for maintenance from next week. Please return all books before then.', 'General'),
  ('Hackathon Registration', 'Annual coding hackathon registration is now open. Showcase your skills!', 'Events'),
  ('WiFi Upgrade', 'Campus WiFi will be upgraded this weekend. Expect brief interruptions.', 'Technical');
```

---

## Step 3: Run the App

```bash
flutter run
```

Or use your IDE's run button.

---

## Step 4: Test the App

### Test Authentication:
1. **Sign Up:**
   - Open the app
   - Click "Sign up"
   - Enter email: `test@example.com`
   - Enter password: `password123` (at least 6 characters)
   - Click "Sign Up"
   - ✅ Should navigate to home screen

2. **Sign Out & Sign In:**
   - Go to Profile tab
   - Click "Logout"
   - Sign in with the same credentials
   - ✅ Should work

### Test Features:
1. **Events Screen:**
   - Go to Events tab
   - ✅ Should see the sample events you added
   - Click "Register Now" on an event
   - ✅ Should show "Registered" status

2. **Home Screen:**
   - Check if wallet balance shows (should be ₹0.00)
   - ✅ Should see upcoming events and announcements

3. **Wallet Screen:**
   - Go to Wallet tab
   - Click "Add Money"
   - Enter an amount
   - ✅ Should add transaction

---

## Step 5: Verify Database Connection

### Check in Supabase Dashboard:

1. **Table Editor** → `profiles`
   - After signing up, you should see a new profile entry
   - ✅ User ID should match auth.users

2. **Table Editor** → `wallets`
   - Should see a wallet entry for your user
   - ✅ Balance should be 0.00

3. **Table Editor** → `event_registrations`
   - After registering for an event, check here
   - ✅ Should see registration entry

---

## Troubleshooting

### If app crashes on startup:
- Check if Supabase is initialized in `main.dart`
- Verify internet connection
- Check console for error messages

### If authentication fails:
- Go to Supabase Dashboard → Authentication → Settings
- Make sure "Email" provider is enabled
- Check if email confirmation is required (disable for testing)

### If tables are empty:
- Make sure you ran all SQL scripts correctly
- Check Table Editor to verify tables exist
- Verify Row Level Security policies are set

### If events/announcements don't show:
- Make sure `is_active = true` in the database
- Check if RLS policies allow SELECT
- Verify data was inserted correctly

---

## What's Working Now ✅

- ✅ User authentication (sign up, sign in, sign out)
- ✅ User profile creation
- ✅ Wallet creation
- ✅ Events display and registration
- ✅ Announcements display
- ✅ Transaction history

## What Needs More Work 🔧

- **Profile Screen:** Currently shows hardcoded data - needs to fetch from Supabase
- **Home Screen:** Events and announcements are hardcoded - needs Supabase integration
- **Wallet Screen:** Add money feature needs backend integration
- **Attendance Screen:** QR scanner needs implementation
- **Digital ID Screen:** Needs to fetch user data from Supabase

---

## Quick Commands Reference

```bash
# Install dependencies
flutter pub get

# Run app
flutter run

# Clean build
flutter clean
flutter pub get

# Check for errors
flutter analyze
```

---

## Need Help?

If something doesn't work:
1. Check the console/terminal for error messages
2. Verify Supabase connection in dashboard
3. Check if tables have data
4. Verify RLS policies are correct

You're all set! 🎉 Start testing your app now.
