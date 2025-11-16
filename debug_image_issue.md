# Debug Category Images Not Showing

## Step 1: Test Laravel Backend in PC Browser

Open Chrome and test these URLs:

1. **API endpoint**: `http://localhost:8000/api/home`
   - This should return JSON with categories
   - Check what the `icon` field contains for each category

2. **Direct image**: `http://localhost:8000/storage/categories/tomato.png`
   - This should show the image in your browser
   - If this doesn't work, your Laravel storage link is broken

If Step 2 fails, run in your Laravel project:
```bash
php artisan storage:link
```

## Step 2: Check What API Returns

Look at the JSON from `http://localhost:8000/api/home`:

**Expected format:**
```json
{
  "categories": [
    {
      "id": 1,
      "name": "Tomato",
      "icon": "/storage/categories/tomato.png"  // ✅ Should start with /storage/
    }
  ]
}
```

**If your API returns full URLs like:**
```json
{
  "icon": "http://localhost:8000/storage/categories/tomato.png"
}
```
Then we need to modify the Flutter code to handle full URLs.

## Step 3: Check Flutter Console Output

After FULLY restarting the app (not hot reload), check the console for:

1. **URL being loaded:**
   ```
   Loading image from URL: http://10.0.2.2:8000/storage/categories/tomato.png
   ```

2. **Any errors:**
   ```
   Error loading image from ...: [error message]
   ```

## Step 4: Verify App Was Fully Restarted

- Stop the app completely (don't just hot reload)
- Run `flutter clean` if needed
- Run `flutter run` again

## Common Issues:

1. ❌ **App not fully restarted** - Hot reload doesn't apply AndroidManifest changes
2. ❌ **Storage link not created** - Run `php artisan storage:link`
3. ❌ **Wrong icon path in database** - Should be `/storage/categories/image.png`
4. ❌ **API returns full URLs** - Need to modify Flutter code
